Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED03C433EF
	for <ath11k@archiver.kernel.org>; Mon,  7 Feb 2022 06:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KUgQ4Gh5qUw1H/A2/Jzq8wRHCQVBJF1E4d5NCl+New=; b=GA7GvU32HorkMx
	7oS+soXDzTeBJlR+v9srIO3/UdbcLLUvEv8qLxZuG3odDdN7G1RwmDMaT4CFsaBnN/n7gbzUWzj1M
	LE06JL7Xfs49oFmRYQGjwDLJuMszns/sB6S5qDz2xUuZqyIanezgAuTdyT7Tg+e3IHFObpS+6oZO3
	qjVXRY29iigai/xbIpGLrCeak36/Pvi+ZOUZqjy1fZJ37i9O1GsUmA/R72XpqnGAKC2Y2F+yG0i12
	ODipJYt7aCJbnIc0i/D/gC78iaZp9kATUq81Jq1Vs5YUp4kwY08KTZnYqAzWSi4iSRUytS2uw5Qoe
	l7d/b+mm2yJrHi2myQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGxGZ-0096rX-QL; Mon, 07 Feb 2022 06:12:47 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGxGX-0096qm-Bc
 for ath11k@lists.infradead.org; Mon, 07 Feb 2022 06:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644214365; x=1675750365;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=q4Bf9L82tihKoR0vEAiIJKFbpWaB/+VxOKF7u7RB5lQ=;
 b=pu3ddJzt3QBSNjHOyO4CvzRPsXz8+McUdWesKvG8UkIQJKImt016gNRw
 9ob79xi/u72boGhU3qHuLNGmWPZIlsI8WZxRg1MeHZqErxveUJCT/m7oQ
 yNTZlv1PfSRxgjnj9oqRqXaQRjgy0j6HMjXQ7ZVZrn8Voq3jXmyX7/r7m g=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 06 Feb 2022 22:12:40 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2022 22:12:39 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 6 Feb 2022 22:12:39 -0800
Received: from [10.253.38.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Sun, 6 Feb 2022
 22:12:38 -0800
Message-ID: <1f02d646-892b-1c0a-2081-f4ee579e940a@quicinc.com>
Date: Mon, 7 Feb 2022 14:12:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 0/2] ath11k: add handler for board-2.bin without
 variant and read SMBIOS
Content-Language: en-US
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20211220064829.17557-1-quic_wgong@quicinc.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20211220064829.17557-1-quic_wgong@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_221245_483008_C5636749 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Kalle,

Do you have any comment for this patch set?

On 12/20/2021 2:48 PM, Wen Gong wrote:
> v5:
>     1. rebased to ath.git ath-202112161538
>     2. fix warning "failed to fetch board data for bus=pci,qmi-chip-id=0,qmi-board-id=255,variant=DE_1901 from ath11k/QCA6390/hw2.0/board-2.bin"
>
> v4:
>     1. add helper function ath11k_core_create_fallback_board_name()
>     2. rebased to ath.git ath-202112071521
>
> v3:
>     1. add patch "ath11k: add fallback board name without variant while searching board-2.bin"
>     2. reabsed to latest ath.git master ath-202111221436
>
> v2: rebased to latest ath.git master ath-202111170737
>
> When it does not have matched board name with variant in board-2.bin,
> ath11k will fallback to search without variant.
>
> Also read the variant from SMBIOS.
>
> Wen Gong (2):
>    ath11k: add fallback board name without variant while searching
>      board-2.bin
>    ath11k: add read variant from SMBIOS for download board data
>
>   drivers/net/wireless/ath/ath11k/core.c | 109 +++++++++++++++++++++++--
>   drivers/net/wireless/ath/ath11k/core.h |  11 +++
>   drivers/net/wireless/ath/ath11k/qmi.c  |   4 +
>   3 files changed, 118 insertions(+), 6 deletions(-)
>
>
> base-commit: 12018ad8603a598d773e2cae12542a1981c94886

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
