Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaciy-0003bB-0F
 for ath11k@lists.infradead.org; Thu, 05 Nov 2020 10:42:37 +0000
References: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com>
 <87lffjodu7.fsf@codeaurora.org>
 <fa338986-8de4-fde1-6805-d46793c947e4@gmail.com>
 <c9cc0ec6-4dda-2608-3575-0e6dfb6d0852@gmail.com>
 <87ft5rszcs.fsf@codeaurora.org> <87ft5qsem9.fsf@codeaurora.org>
 <f99862f4-9b3a-03e5-cd26-1de6136f9e46@gmail.com>
 <87blgdscxd.fsf@codeaurora.org>
 <229c31e7-9aff-18e6-a6db-be7b46331173@gmail.com>
 <87361onphy.fsf_-_@codeaurora.org>
From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: Regression: QCA6390 fails with "mm/page_alloc: place pages to
 tail in __free_pages_core()"
Message-ID: <d6fb1e30-0d19-9af3-337b-69ff11c2fc6c@suse.cz>
Date: Thu, 5 Nov 2020 11:42:33 +0100
MIME-Version: 1.0
In-Reply-To: <87361onphy.fsf_-_@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>, Pavel Procopiuc <pavel.procopiuc@gmail.com>, david@redhat.com
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, linux-kernel@vger.kernel.org

On 11/5/20 10:04 AM, Kalle Valo wrote:
> (changing the subject, adding more lists and people)
> 
> Pavel Procopiuc <pavel.procopiuc@gmail.com> writes:
> 
>> Op 04.11.2020 om 10:12 schreef Kalle Valo:
>>> Yeah, it is unfortunately time consuming but it is the best way to get
>>> bottom of this.
>>
>> I have found the commit that breaks things for me, it's
>> 7fef431be9c9ac255838a9578331567b9dba4477 mm/page_alloc: place pages to
>> tail in __free_pages_core()
>>
>> I've reverted it on top of the 5.10-rc2 and ath11k driver loads fine
>> and I have wifi working.
> 
> Oh, very interesting. Thanks a lot for the bisection, otherwise we would
> have never found out whats causing this.
> 
> David & mm folks: Pavel noticed that his QCA6390 Wi-Fi 6 device (driver
> ath11k) failed on v5.10-rc1. After bisecting he found that the commit
> below causes the regression. I have not been able to reproduce this and
> for me QCA6390 works fine. I don't know if this needs a specific kernel
> configuration or what's the difference between our setups.
> 
> Any ideas what might cause this and how to fix it?
> 
> Full discussion: http://lists.infradead.org/pipermail/ath11k/2020-November/000501.html
> 
> commit 7fef431be9c9ac255838a9578331567b9dba4477
> Author:     David Hildenbrand <david@redhat.com>
> AuthorDate: Thu Oct 15 20:09:35 2020 -0700
> Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> CommitDate: Fri Oct 16 11:11:18 2020 -0700
> 
>      mm/page_alloc: place pages to tail in __free_pages_core()
> 

Let me paste from the ath11k discussion:

> * Relevant errors from the log:
> # journalctl -b | grep -iP '05:00|ath11k'
> Nov 02 10:41:26 razor kernel: pci 0000:05:00.0: [17cb:1101] type 00 class 0x028000
> Nov 02 10:41:26 razor kernel: pci 0000:05:00.0: reg 0x10: [mem 0xd2100000-0xd21fffff 64bit]
> Nov 02 10:41:26 razor kernel: pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
> Nov 02 10:41:26 razor kernel: pci 0000:05:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at 
> 0000:00:1c.1 (capable of 7.876 Gb/s with 8.0 GT/s PCIe x1 link)
> Nov 02 10:41:26 razor kernel: pci 0000:05:00.0: Adding to iommu group 21
> Nov 02 10:41:27 razor kernel: ath11k_pci 0000:05:00.0: WARNING: ath11k PCI support is experimental!
> Nov 02 10:41:27 razor kernel: ath11k_pci 0000:05:00.0: BAR 0: assigned [mem 0xd2100000-0xd21fffff 64bit]
> Nov 02 10:41:27 razor kernel: ath11k_pci 0000:05:00.0: enabling device (0000 -> 0002)
> Nov 02 10:41:27 razor kernel: mhi 0000:05:00.0: Requested to power ON
> Nov 02 10:41:27 razor kernel: mhi 0000:05:00.0: Power on setup success
> Nov 02 10:41:27 razor kernel: ath11k_pci 0000:05:00.0: Respond mem req failed, result: 1, err: 0

This seems to be ath11k_qmi_respond_fw_mem_request(). Why is it failure with 
error 0? No idea.

What would happen if all the GFP_KERNEL in the file were changed to GFP_DMA32?

I'm thinking the hardware perhaps doesn't like too high physical addresses or 
something. But if I think correctly, freeing to tail should actually move them 
towards head. So it's weird.

> Nov 02 10:41:27 razor kernel: ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-22
> Nov 02 10:41:32 razor kernel: ath11k_pci 0000:05:00.0: qmi failed memory request, err = -110
> Nov 02 10:41:32 razor kernel: ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-110
> Nov 02 10:42:58 razor kernel: mhi 0000:05:00.0: Device failed to exit MHI Reset state


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
