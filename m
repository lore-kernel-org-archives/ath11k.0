Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSkGf-0005g6-8E
 for ath11k@lists.infradead.org; Thu, 07 Nov 2019 16:04:18 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 02/49] ath11k: add Kconfig
References: <1571565847-10338-1-git-send-email-kvalo@codeaurora.org>
 <1571565847-10338-3-git-send-email-kvalo@codeaurora.org>
 <6ffc215251b54d562496d978bdbbcead@codeaurora.org>
Date: Thu, 07 Nov 2019 18:04:13 +0200
In-Reply-To: <6ffc215251b54d562496d978bdbbcead@codeaurora.org> (Jeff Johnson's
 message of "Mon, 21 Oct 2019 13:53:51 -0700")
Message-ID: <87ftizy8oy.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Jeff Johnson <jjohnson@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Jeff Johnson <jjohnson@codeaurora.org> writes:

> On 2019-10-20 03:03, Kalle Valo wrote:
>> [...snip...]
>> +config ATH11K_TRACING
>> +	bool "ath11k tracing support"
>> +	depends on ATH11K && EVENT_TRACING
>> +	---help---
>> +	  Select this to ath11k use tracing infrastructure.
>
> Help text does not parse

Will be fixed in v3:

https://patchwork.kernel.org/patch/11233257/

Thanks for the review.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
