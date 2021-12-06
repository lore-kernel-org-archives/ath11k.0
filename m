Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2880BC433F5
	for <ath11k@archiver.kernel.org>; Mon,  6 Dec 2021 07:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jeEOV2sXOVh4ICN3Fu5ofWcLWDZpvj+TKbzbcjHT48=; b=HTrbd0tDVorTsI
	DlOadYXPPMl3Jitz5HXUD5ehnzXbQUw9/Ivr/j/y8jAhHpjov+0rsccvaibeANwZ8M0dK3LebMqOs
	pdijb8oMfzYbb01TnuxMYcQKcIu68QXsTczIHhpIgz1XCfOPODW9DVk7+e18111eB+XlFcJwwnhk/
	S7XB0WckTDv1OdWa1dVcr0Wph1RdD2ckjXWWRWn2d47LlMs9d9WjhJk5XX6ii8LSvv9VZ4EPTnBlh
	F9SHVOxgKeNCZkD9lb2a8ORAnGQ05nmPZtGuYM6MxPUoNowHknByyVCNBJV3BPmPo3YSnUUc1w0qC
	DWi5NN3LASKrFjnisfuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mu89A-002k4a-Ql; Mon, 06 Dec 2021 07:10:48 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mu898-002k48-4t
 for ath11k@lists.infradead.org; Mon, 06 Dec 2021 07:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638774646; x=1670310646;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fbVwg0B5GwJLw1W8+Pmo/+Yfmm7M604GMenCQ8i1h8I=;
 b=EpIqTo5+7uVfl8s5CDzPczZMGi2p3oYCd8TLfDmaC9qjhgewMa1MsbZl
 ZeOND9ZCJwJhA0e4UaEbvB/MJgXFeXITwPuRIA/TBEP+YE21TH3RNWwI8
 IVOATWymPwAKGSY2Z3MrxNdmhsP5IJnBq2t3rkVW+FBUrrmJYHFUp1ocA s=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 05 Dec 2021 23:10:44 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2021 23:10:44 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 5 Dec 2021 23:10:43 -0800
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Sun, 5 Dec 2021
 23:10:42 -0800
Message-ID: <71ee85b5-8d8c-c6e5-20a2-d225800de2ba@quicinc.com>
Date: Mon, 6 Dec 2021 15:10:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] ath11k: enable IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for
 WCN6855
Content-Language: en-US
To: Sven Eckelmann <sven@narfation.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20211129101309.2931-1-quic_wgong@quicinc.com>
 <1854698.r8H18GsEis@ripper>
 <7318ffac-f5ec-4c1b-3e80-c816bdb28a79@quicinc.com>
 <7418334.kqliQQpNxi@ripper>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <7418334.kqliQQpNxi@ripper>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_231046_291621_861492AB 
X-CRM114-Status: UNSURE (   6.27  )
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

On 12/6/2021 2:56 PM, Sven Eckelmann wrote:
> On Monday, 6 December 2021 04:29:39 CET Wen Gong wrote:
> [...]
>> I did test in my setup, not see the crash.
>>
>> I am afraid you also need this patch("ath11k: change to use dynamic
>> memory for channel list of scan",
>>
>> https://patchwork.kernel.org/project/linux-wireless/patch/20211129110939.15711-1-quic_wgong@quicinc.com
>> )
>>
>> Could you apply this patch and try again?
> Tried it and I see the same problem.
Could you tell what is your test steps?
>
> Kind regards,
> 	Sven

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
