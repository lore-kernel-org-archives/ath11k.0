Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYNVY-0000TJ-TT
 for ath11k@lists.infradead.org; Tue, 12 May 2020 05:31:14 +0000
MIME-Version: 1.0
Date: Tue, 12 May 2020 11:01:09 +0530
From: govinds@codeaurora.org
Subject: Re: [PATCH 1/4] ath11k: Add PCI client driver for QCA6390 chipset
In-Reply-To: <87h7wm4akt.fsf@kamboji.qca.qualcomm.com>
References: <20200508085850.23363-1-govinds@codeaurora.org>
 <20200508085850.23363-2-govinds@codeaurora.org>
 <87h7wm4akt.fsf@kamboji.qca.qualcomm.com>
Message-ID: <2028987516458b3145d3cd9758eafe8f@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Hi Kalle,

On 2020-05-11 23:29, Kalle Valo wrote:
> Govind Singh <govinds@codeaurora.org> writes:
> 
>> QCA6390 is PCI based 11ax chipset, add
>> pci client driver for QCA6390 target.
>> 
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> 
> This patch had multiple problems, most important ones were:
> 
> * a break missing in ath11k_pci_probe()
> 

My bad. Thanks for fixing same.

> * it's not possible to have static variables in .h files, I fixed by
>   moving the ring variables to core.c in a separate patch:
> 
>   https://patchwork.kernel.org/patch/11541355/
> 
> * this patch didn't link (at least when compiling as modules), I fixed
>   those by adding missing EXPORT_SYMBOL() macros
> 

Looks, this is required after moving the ring mask from ahb to core.

> Please double check my changes:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=44a28b572070f578914367dc2469cef48ece13f4

Looks good to me.

BR,
Govind

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
