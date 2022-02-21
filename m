Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB16FC433F5
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 07:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5juvPv2YxY4SNkEOgcWdng6oNqt5t+a6dFOskFF0E0E=; b=t0q2Y1ODCcFYpm
	J11IG2YjZ8fegxCM9hJJzLaY88W0exQCpQG6G9r7hkbWMCiXsYr6b4FJfSUduYEkpHe/+EIO1GtmZ
	5xerq3KPDT7wE931ZY5XiG0BXz27YzLb2eAx9E7da/bqM71X8XGqYm5wyW+LfBmr0gzoA8Mx7IDAw
	bwHtshhxUHh2icSiE6XklxyNIcxCQLuaXewmuP4zKU4B+OCAEmMeV+ukmphKpMiDqwJNG5JIt8OfJ
	I3twKiFT8YfLowCSpPxzm0OdPqmbcK0kwWwGWfEgXoZrQLElJd1XsQ89m3RjGPuuDybPan3mhwtg+
	GMwD8YLgoJ4dqT6Bij3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM2o4-003vAk-Nb; Mon, 21 Feb 2022 07:08:24 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM2o1-003v9V-JM
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 07:08:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645427301; x=1676963301;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HNEjPfVKyvbamr3VLeL3xP7XOK3C+XggboIOMVTTtBQ=;
 b=bz4z08zJy9YVi1Lu9dsMraG5IWpj2fYNFSOxZ660PtY7IpU/Sc4ZniUc
 /RC2h+STbYvMRmZ3+DN02v2FIg3ZQ9F5R9ICFR/CfYYB32naPbR6gEOwP
 Eo64RaRvKu2TVvFT8YxR3VGPBtIXXb6AhdacrcJaHi1V5NeFTgDRuZvDM k=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 20 Feb 2022 23:08:21 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2022 23:08:21 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sun, 20 Feb 2022 23:08:20 -0800
Received: from [10.216.7.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Sun, 20 Feb
 2022 23:08:17 -0800
Message-ID: <5084e315-bb23-280b-27ac-d974c1a719c1@quicinc.com>
Date: Mon, 21 Feb 2022 12:38:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 19/19] dt: bindings: net: add bindings of WCN6750 for
 ath11k
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-20-git-send-email-quic_mpubbise@quicinc.com>
 <87wnikf8jn.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <87wnikf8jn.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_230821_712459_ACD41FCC 
X-CRM114-Status: UNSURE (   6.38  )
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



On 1/28/2022 4:09 PM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>> Add WCN6750 wireless driver support, its based on ath11k driver.
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> 
> Device tree bindings should be first in the patchset.
> 
> I'm no DT expert, but you have a lot of changes in the bindings and it
> would be nice to have some kind of description what you are doing here.
> 

Sure.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
