Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290E6C433EF
	for <ath11k@archiver.kernel.org>; Wed,  2 Feb 2022 22:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=worU/wVcoPR8mkfBPrYRX8CWLxjWzqMp8UkuLxolAkI=; b=iMu4YnfHyi0oeO
	D2oQBJV8v008LYU2dw0yTS6jLsQ2xZijPVTpiy21SzFLTphHvqPaqeb/09ngRPj7adF18ymMU3ncc
	aVqvdbUOzAha08OIh9adXLeluVUamaS/o2jDoz3n3bGUnqKkDE6daKVookV0fgZ1BaML66Ny+tFSK
	4ZgtUm1Ne25inT+xLxNqUxmcGDKyCcDHqjwc2NRoS05hNvzKaXPDIFzTagqlQFUKR06v1vfZzAu3p
	Upen5IhhGLq0U4UXuDZEN23bj+y19JNdsvTI8McAPJhUEnfr15uOU7ZwT1G1vRwCQFoAzMfEw2dGF
	3wodcLL8wG5leKVkcPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFOWm-00H2yu-0P; Wed, 02 Feb 2022 22:55:04 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFOWj-00H2yF-G1
 for ath11k@lists.infradead.org; Wed, 02 Feb 2022 22:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643842501; x=1675378501;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fsvp8nQn++8KMwiHAngOAty1fTyj7nrCgipTrE7ZBLc=;
 b=v33+5K0uysO0Gc04XIRtMFpyTlN6dx66D7cPz4Zbr10Ojn4G2rklgPPz
 w/t6THbTEVRsmNemLqE3fXgrt4JOiRCDf5TeBc6SFwWvaSEqQaK3ZXacZ
 mguwGW33GKPIuuma/gKto/jcAFcn5K2NFPYh/ZUZcBkm5jfH7ObL2+7jk 4=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 02 Feb 2022 14:54:56 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 14:54:55 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 2 Feb 2022 14:54:55 -0800
Received: from [10.48.243.21] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 2 Feb 2022
 14:54:55 -0800
Message-ID: <de395fa7-6906-bdef-19c7-dbc229bd35e9@quicinc.com>
Date: Wed, 2 Feb 2022 14:54:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3] ath11k: Add peer rhash table support
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <1643787194-31355-1-git-send-email-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <1643787194-31355-1-git-send-email-quic_periyasa@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_145501_622655_6F26465B 
X-CRM114-Status: UNSURE (   3.43  )
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

On 2/1/2022 11:33 PM, Karthikeyan Periyasamy wrote:
> + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.

should now be 2021-2022 in all copyrights?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
