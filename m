Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5BFEE4993
	for <ath11k@archiver.kernel.org>; Tue, 22 Aug 2023 16:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zAr+E8SqK9n9s1Sf748/VBYHkwJXvMe58YMoLyC33nw=; b=pmtl2TknCHCk3k
	F9YSbxbm23f9tDwjK2zgTlq5xCVIIlFbCCACL2ynwvls2dfwiJUNqHmRbvyPc5wd3oyArM2Rzli8S
	xfr9IIFGPJR+jTJpXqMhU6SowJq81a0fGu3j2fixBExRNNUX4QTe90aWce6oG1cXcgwKBQmd83AXg
	NdThcR8RDBUa5gqo4cTzGVZuAxDC98FuhFXVoY/kTqID8s6dj2voQ+X3AwMqDRek28Cur7k77Mh1d
	2W+Ct6+8ijKpBngrIhPWx50yfPw/O8ni5x8B6yYRNUUsxhBAtwuYMAg8vWofdIK1B/g5j1rbGMEM8
	u19JthBKdQE+sV2j5VJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYU37-00GRwx-2o;
	Tue, 22 Aug 2023 16:16:09 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qYU35-00GRvY-1H;
	Tue, 22 Aug 2023 16:16:07 +0000
Message-ID: <0f59a646-74e4-22ac-5510-25d45f8816d9@infradead.org>
Date: Tue, 22 Aug 2023 09:16:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/3] wifi: ath11k: Fix a few spelling errors
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org
References: <20230822-ath_spelling-v1-0-8e2698759564@quicinc.com>
 <20230822-ath_spelling-v1-2-8e2698759564@quicinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230822-ath_spelling-v1-2-8e2698759564@quicinc.com>
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
>  drivers/net/wireless/ath/ath11k/dp.h    | 2 +-
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 2 +-
>  drivers/net/wireless/ath/ath11k/dp_tx.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

-- 
~Randy

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
