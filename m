Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01742C433F5
	for <ath11k@archiver.kernel.org>; Fri, 15 Apr 2022 06:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdpmr7jHL+thvHWjFgORtMh13ADgQDww0zrz94LTiVo=; b=NTWk5P1Om3s4w0
	8pslJVvgYaOQojfPvfX7uDMgbEqx5NZlOOf7Gau2mQscs1c2flP+3wZG6lxrGKyLGI4KTcyJtdTPl
	Kw0Yi0hWdnXsBO1jKB0CGREsYytfRZvHWrcGIE9+eeyYTjXn7M0KEArsdM9TylErQlSgoPy5pIRLc
	rsRbgew7I/YvQJHWSE9lU46ws/732OY3cfwfjIsbtOHc3LqBs8PHRZEN085imi7Fp+AFWIrpd2dPM
	gS4LJvLvRJ8ptX9omGoykfRbb6mpxxn8F5LYBs8pYI7XbaX5U3RLewFkFb/OgHThsnDFYGTtWMheu
	VCz25aorq+RIa3XZgBNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfFsl-009863-2d; Fri, 15 Apr 2022 06:56:39 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfFsi-00985W-D7
 for ath11k@lists.infradead.org; Fri, 15 Apr 2022 06:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650005796; x=1681541796;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=t2JyKHgJzNVEtMBMT1fofHfCUqQE1R9r4NG3h8NrjI8=;
 b=pvbwW0C11+qnWdAWxaMiAxY+2P/cTne0DGa4ZqeS6O+jLKCD5Tj+W/wF
 cFRNpBX53q3wRFllrI8Aen0FbYMqKnuy+c/KU+6jILOY/4qx6o9mA95YC
 RWSvuo0kYbOqVEobHODd5yw9r+ZZ8hqZibQ7uVnrEX17oi3qoTPKLpU2o 4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Apr 2022 23:56:35 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 23:56:36 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Apr 2022 23:56:34 -0700
Received: from [10.253.8.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Apr
 2022 23:56:31 -0700
Message-ID: <c503b9b8-062d-d8c8-1d9f-106602dd31c4@quicinc.com>
Date: Fri, 15 Apr 2022 14:56:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ath11k: simplify if-if to if-else
Content-Language: en-US
To: Benjamin Poirier <benjamin.poirier@gmail.com>, Yihao Han
 <hanyihao@vivo.com>
CC: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <kernel@vivo.com>
References: <20220414092042.78152-1-hanyihao@vivo.com> <YlkN1FsTd0Bozz0K@d3>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <YlkN1FsTd0Bozz0K@d3>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_235636_530256_ADF324BA 
X-CRM114-Status: UNSURE (   5.70  )
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

On 4/15/2022 2:16 PM, Benjamin Poirier wrote:
> On 2022-04-14 02:20 -0700, Yihao Han wrote:
...
> It seems there is no synchronization around is_reset but is it
> guaranteed that it cannot be changed by ath11k_core_reset() between the
> two tests? I'm not familiar with the driver.

ath11k_core_reset() has logic to avoid muti-reset in the same time.

it means it has one recovery work doing for each time.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
