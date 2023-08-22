Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FFDEE4993
	for <ath11k@archiver.kernel.org>; Tue, 22 Aug 2023 16:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6T9umSEpOr0RFJdC1PnG2VSxjFN3UubxvdhA4trunE=; b=1PVFaxXUrcm5ci
	yo5O3wKoTX6HlaVBB8ekcgCTbzypK+D0RRYV/8q3s0tuQEJI36Z1O54iV2iyKE8dEUdtoBMcPJBBm
	nj/PG2mW1u1I+MuFyQgiw9qNSlrm5T9duBCLtRJOxMj0Dz4DfzeCA3wAZhCD1dh7Fz6npd40Bb/5V
	Ps71nyfsano7ZQE7bbIuu7aWiwZzmotdFAurKWorGL3JD61jLnbmruR5z/ZV1mayNHJv15r7LKQFt
	AseW9VqeOcUyEyUnP6jnxS2OgcTVdqm+NlIfmmglBNtB5DBAGMKCIeYijsOUy46e/McsmEWL9ZN1u
	P0c6SqwJdUHZ/OrYsuEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYU1j-00GRQ9-0z;
	Tue, 22 Aug 2023 16:14:43 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qYU1f-00GRNI-1N;
	Tue, 22 Aug 2023 16:14:39 +0000
Message-ID: <8d8c94d0-8c15-e1c4-cbe4-a1362af4d5f7@infradead.org>
Date: Tue, 22 Aug 2023 09:14:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] wifi: ath10k: Fix a few spelling errors
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org
References: <20230822-ath_spelling-v1-0-8e2698759564@quicinc.com>
 <20230822-ath_spelling-v1-1-8e2698759564@quicinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230822-ath_spelling-v1-1-8e2698759564@quicinc.com>
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 8/22/23 07:50, Jeff Johnson wrote:
> Fix a few issues flagged by 'codespell'.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath10k/htt.h  | 4 ++--
>  drivers/net/wireless/ath/ath10k/pci.c  | 2 +-
>  drivers/net/wireless/ath/ath10k/sdio.c | 2 +-
>  drivers/net/wireless/ath/ath10k/wmi.h  | 8 ++++----
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

-- 
~Randy

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
