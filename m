Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D08C433EF
	for <ath11k@archiver.kernel.org>; Tue, 10 May 2022 15:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFnqBqjkQqakI74bSUCBenw109ABEBzW7dY6V6vR2eY=; b=hGh5uvRoU0Ryf0
	Ng7+uwqoXPJppIWlLs0TOVi2ROoaBruML4hwTvkdldhmDk/FMoG/eiHRdg/XSPYhmNqWbzYGBI1BY
	8kQUnXFxZkJoSzkP0B+wXzDDMiovPTiZECRksfE9Q9bndt2pjMfUZg+meosYmtFnQ5gmMq6Bx1+o1
	8B+AAx9jRveDC5L0rH70LWhv/CtgrhgqcLICtxUcxrk/T9KOGmWDqMZvxd88UDtj1HEUWL+ee2N1s
	M77FeiUaSYz8VkuA/8MMsyMjK+Z0jinNMBkuZFa9i/6/Va1md3ZoHyVa7/rAKYfnSabzUYLjto+D0
	ROKeSfFBCTlvX2iF6dpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noSCL-002t7p-B2; Tue, 10 May 2022 15:54:53 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noSCJ-002t39-40
 for ath11k@lists.infradead.org; Tue, 10 May 2022 15:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652198091; x=1683734091;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pbUNbiRjJBni932h94thKOPgsK1fszswCWS4ynAZ8os=;
 b=FyjTBO95vVEkrGNfsGbIu4DprAq6FivdtC6a5urX2aJO8aeaqF8OHele
 gX/Y/klbR205j820pTVEpp0BfG4UiCSBmimYWQEc4gSXUvgyhcaEZRTvM
 wCx2mO+hNAG4JnStaoGiH8Kweur1dMD+KetWiq8IXd9OSkwzIvAhHYgNM c=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 10 May 2022 08:54:48 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 08:54:48 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 10 May 2022 08:54:47 -0700
Received: from [10.110.84.131] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 10 May
 2022 08:54:47 -0700
Message-ID: <a4e023e1-9c8d-bdfe-1060-48a68fb46e74@quicinc.com>
Date: Tue, 10 May 2022 08:54:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] ath11k: update missing mumimo and ofdma stats
Content-Language: en-US
To: Sriram R <quic_srirrama@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <1652152236-12038-1-git-send-email-quic_srirrama@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <1652152236-12038-1-git-send-email-quic_srirrama@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_085451_236304_1BC206C4 
X-CRM114-Status: UNSURE (   3.19  )
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

On 5/9/2022 8:10 PM, Sriram R wrote:
> Update the missing MU-MIMO/OFDMA info in PDEV RX,

nit: can we use MU-MIMO and OFDMA in the subject as well?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
