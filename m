Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdUHQ-00026K-EA
 for ath11k@lists.infradead.org; Fri, 13 Nov 2020 08:18:01 +0000
Received: by mail-ej1-x62a.google.com with SMTP id w13so12041604eju.13
 for <ath11k@lists.infradead.org>; Fri, 13 Nov 2020 00:17:58 -0800 (PST)
Subject: Re: Regression: QCA6390 fails with "mm/page_alloc: place pages to
 tail in __free_pages_core()"
References: <d6fb1e30-0d19-9af3-337b-69ff11c2fc6c@suse.cz>
 <8ACA82DB-D2FE-4599-8A01-D42218FDE1E5@redhat.com>
 <87eekz4s04.fsf@codeaurora.org>
 <9d307c40-5ea1-8938-819d-f1742cb99945@gmail.com>
 <cd8d1b1d-a646-b9b1-ed2a-4aa7070efe00@redhat.com>
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Message-ID: <dd24598f-7635-c2e2-9c6d-f320770e3b9e@gmail.com>
Date: Fri, 13 Nov 2020 09:17:55 +0100
MIME-Version: 1.0
In-Reply-To: <cd8d1b1d-a646-b9b1-ed2a-4aa7070efe00@redhat.com>
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
To: David Hildenbrand <david@redhat.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org, ath11k@lists.infradead.org, Vlastimil Babka <vbabka@suse.cz>

Op 12.11.2020 om 11:48 schreef David Hildenbrand:
> Trying to understand the code, it looks like there are always two rounds of reqests. The first one always fails 
> ("requesting one big chunk of DMA memory"), the second one (providing multiple chunks of DMA memory) is supposed to work 
> - and we do allocate memory.
> 
> 
> In the *working* cases we have
> 
> Respond mem req failed, result: 1, err: 0
> qmi failed to respond fw mem req:-22
> ...
> chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
> 
> We don't fail in qmi_txn_wait() - second request w
> 
> 
> In the *non-working* cases we have
> 
> Respond mem req failed, result: 1, err: 0
> qmi failed to respond fw mem req:-22
> ...
> qmi failed memory request, err = -110
> qmi failed to respond fw mem req:-110
> 
> We fail in qmi_txn_wait(). We run into a timeout (ETIMEDOUT).
> 
> Can we bump up the timeout limit and see if things change? Maybe FW needs more time with other addresses.

I tried increasing ATH11K_QMI_WLANFW_TIMEOUT_MS 20 times to 100000 (i.e. 100 seconds) and it didn't have any positive 
effect, the second error (-110) just came 100 seconds later and not 5.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
