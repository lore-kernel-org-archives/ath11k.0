Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kacmG-0003nR-8R
 for ath11k@lists.infradead.org; Thu, 05 Nov 2020 10:46:01 +0000
Received: by mail-ed1-x52a.google.com with SMTP id a71so1004298edf.9
 for <ath11k@lists.infradead.org>; Thu, 05 Nov 2020 02:45:58 -0800 (PST)
Subject: Re: Regression: QCA6390 fails with "mm/page_alloc: place pages to
 tail in __free_pages_core()"
References: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com>
 <87lffjodu7.fsf@codeaurora.org>
 <fa338986-8de4-fde1-6805-d46793c947e4@gmail.com>
 <c9cc0ec6-4dda-2608-3575-0e6dfb6d0852@gmail.com>
 <87ft5rszcs.fsf@codeaurora.org> <87ft5qsem9.fsf@codeaurora.org>
 <f99862f4-9b3a-03e5-cd26-1de6136f9e46@gmail.com>
 <87blgdscxd.fsf@codeaurora.org>
 <229c31e7-9aff-18e6-a6db-be7b46331173@gmail.com>
 <87361onphy.fsf_-_@codeaurora.org>
 <d6fb1e30-0d19-9af3-337b-69ff11c2fc6c@suse.cz>
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Message-ID: <2dfa9cd3-5b95-3e0b-8ffa-64d38540c573@gmail.com>
Date: Thu, 5 Nov 2020 11:45:56 +0100
MIME-Version: 1.0
In-Reply-To: <d6fb1e30-0d19-9af3-337b-69ff11c2fc6c@suse.cz>
Content-Language: en-US
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Vlastimil Babka <vbabka@suse.cz>, Kalle Valo <kvalo@codeaurora.org>, david@redhat.com
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, linux-kernel@vger.kernel.org

Op 05.11.2020 om 11:42 schreef Vlastimil Babka:
> Let me paste from the ath11k discussion:
> 
>> * Relevant errors from the log:
>> # journalctl -b | grep -iP '05:00|ath11k'
>> Nov 02 10:41:26 razor kernel: pci 0000:05:00.0: [17cb:1101] type 00 class 0x028000
>> Nov 02 10:41:26 razor kernel: pci 0000:05:00.0: reg 0x10: [mem 0xd2100000-0xd21fffff 64bit]
>> Nov 02 10:41:26 razor kernel: pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
>> Nov 02 10:41:26 razor kernel: pci 0000:05:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link 
>> at 0000:00:1c.1 (capable of 7.876 Gb/s with 8.0 GT/s PCIe x1 link)
>> Nov 02 10:41:26 razor kernel: pci 0000:05:00.0: Adding to iommu group 21
>> Nov 02 10:41:27 razor kernel: ath11k_pci 0000:05:00.0: WARNING: ath11k PCI support is experimental!
>> Nov 02 10:41:27 razor kernel: ath11k_pci 0000:05:00.0: BAR 0: assigned [mem 0xd2100000-0xd21fffff 64bit]
>> Nov 02 10:41:27 razor kernel: ath11k_pci 0000:05:00.0: enabling device (0000 -> 0002)
>> Nov 02 10:41:27 razor kernel: mhi 0000:05:00.0: Requested to power ON
>> Nov 02 10:41:27 razor kernel: mhi 0000:05:00.0: Power on setup success
>> Nov 02 10:41:27 razor kernel: ath11k_pci 0000:05:00.0: Respond mem req failed, result: 1, err: 0
> 
> This seems to be ath11k_qmi_respond_fw_mem_request(). Why is it failure with error 0? No idea.
> 
> What would happen if all the GFP_KERNEL in the file were changed to GFP_DMA32?
> 
> I'm thinking the hardware perhaps doesn't like too high physical addresses or something. But if I think correctly, 
> freeing to tail should actually move them towards head. So it's weird.

Well, in fact I still have this particular error, although the hardware works correctly. This is my current log:

# journalctl -b | grep -iP '05:00|ath11k|Linux version'
Nov 05 09:43:31 razor kernel: Linux version 5.10.0-rc2 (root@razor) (gcc (Gentoo 9.3.0-r1 p3) 9.3.0, GNU ld (Gentoo 2.34 
p6) 2.34.0) #4 SMP Thu Nov 5 09:26:00 CET 2020
Nov 05 09:43:31 razor kernel: pci 0000:05:00.0: [17cb:1101] type 00 class 0x028000
Nov 05 09:43:31 razor kernel: pci 0000:05:00.0: reg 0x10: [mem 0xd2100000-0xd21fffff 64bit]
Nov 05 09:43:31 razor kernel: pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
Nov 05 09:43:31 razor kernel: pci 0000:05:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at 
0000:00:1c.1 (capable of 7.876 Gb/s with 8.0 GT/s PCIe x1 link)
Nov 05 09:43:31 razor kernel: pci 0000:05:00.0: Adding to iommu group 21
Nov 05 09:43:32 razor kernel: ath11k_pci 0000:05:00.0: WARNING: ath11k PCI support is experimental!
Nov 05 09:43:32 razor kernel: ath11k_pci 0000:05:00.0: BAR 0: assigned [mem 0xd2100000-0xd21fffff 64bit]
Nov 05 09:43:32 razor kernel: ath11k_pci 0000:05:00.0: enabling device (0000 -> 0002)
Nov 05 09:43:32 razor kernel: mhi 0000:05:00.0: Requested to power ON
Nov 05 09:43:32 razor kernel: mhi 0000:05:00.0: Power on setup success
Nov 05 09:43:32 razor kernel: ath11k_pci 0000:05:00.0: Respond mem req failed, result: 1, err: 0
Nov 05 09:43:32 razor kernel: ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-22
Nov 05 09:43:32 razor kernel: ath11k_pci 0000:05:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
Nov 05 09:43:32 razor kernel: ath11k_pci 0000:05:00.0: fw_version 0x101c06cc fw_build_timestamp 2020-06-24 19:50 fw_build_id
Nov 05 09:43:33 razor NetworkManager[777]: <info>  [1604565813.8043] rfkill1: found Wi-Fi radio killswitch (at 
/sys/devices/pci0000:00/0000:00:1c.1/0000:05:00.0/ieee80211/phy0/rfkill1) (driver ath11k_pci)
Nov 05 09:43:35 razor ModemManager[720]: <info>  Couldn't check support for device 
'/sys/devices/pci0000:00/0000:00:1c.1/0000:05:00.0': not supported by any plugin

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
