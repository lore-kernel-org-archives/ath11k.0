Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdXVD-00034e-9a
 for ath11k@lists.infradead.org; Fri, 13 Nov 2020 11:44:29 +0000
MIME-Version: 1.0
Date: Fri, 13 Nov 2020 19:44:11 +0800
From: Carl Huang <cjhuang@codeaurora.org>
Subject: Re: Regression: QCA6390 fails with "mm/page_alloc: place pages to
 tail in __free_pages_core()"
In-Reply-To: <f1f471905ea99ad9b9c8a8eeae616ff9@codeaurora.org>
References: <d6fb1e30-0d19-9af3-337b-69ff11c2fc6c@suse.cz>
 <8ACA82DB-D2FE-4599-8A01-D42218FDE1E5@redhat.com>
 <87eekz4s04.fsf@codeaurora.org>
 <9d307c40-5ea1-8938-819d-f1742cb99945@gmail.com>
 <cd8d1b1d-a646-b9b1-ed2a-4aa7070efe00@redhat.com>
 <dd24598f-7635-c2e2-9c6d-f320770e3b9e@gmail.com>
 <f1f471905ea99ad9b9c8a8eeae616ff9@codeaurora.org>
Message-ID: <056b74d48fb735c69a6268b18184d7e8@codeaurora.org>
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
To: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Cc: David Hildenbrand <david@redhat.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Kalle Valo <kvalo@codeaurora.org>, akpm@linux-foundation.org, ath11k@lists.infradead.org, Vlastimil Babka <vbabka@suse.cz>

On 2020-11-13 19:08, Carl Huang wrote:
> On 2020-11-13 16:17, Pavel Procopiuc wrote:
>> Op 12.11.2020 om 11:48 schreef David Hildenbrand:
>>> Trying to understand the code, it looks like there are always two 
>>> rounds of reqests. The first one always fails ("requesting one big 
>>> chunk of DMA memory"), the second one (providing multiple chunks of 
>>> DMA memory) is supposed to work - and we do allocate memory.
>>> 
>>> 
>>> In the *working* cases we have
>>> 
>>> Respond mem req failed, result: 1, err: 0
>>> qmi failed to respond fw mem req:-22
>>> ...
>>> chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
>>> 
>>> We don't fail in qmi_txn_wait() - second request w
>>> 
>>> 
>>> In the *non-working* cases we have
>>> 
>>> Respond mem req failed, result: 1, err: 0
>>> qmi failed to respond fw mem req:-22
>>> ...
>>> qmi failed memory request, err = -110
>>> qmi failed to respond fw mem req:-110
>>> 
>>> We fail in qmi_txn_wait(). We run into a timeout (ETIMEDOUT).
>>> 
>>> Can we bump up the timeout limit and see if things change? Maybe FW 
>>> needs more time with other addresses.
>> 
>> I tried increasing ATH11K_QMI_WLANFW_TIMEOUT_MS 20 times to 100000
>> (i.e. 100 seconds) and it didn't have any positive effect, the second
>> error (-110) just came 100 seconds later and not 5.
>> 
> Checked some logs. Looks when the error happens, the physical address 
> are
> very small. Its' between 20M - 30M.
> 
> So could you have a try to reserve the memory starting from 20M?
> Add "memmap=10M\$20M" to your grub.cfg or edit in kernel parameters. so 
> ath11k
> can't allocate from these address.
> 
> Or you can try to reserve even larger memory starting from 20M.
> 
To guarantee ath11k doesn't get physical address below 32M, reserve some 
more, for
example "memmap=12M\$20M".

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
