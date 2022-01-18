Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9002CC433EF
	for <ath11k@archiver.kernel.org>; Tue, 18 Jan 2022 03:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r0zjfc8l3o+C0k9pQVygV/V190MVFWZwDTFNgap0QpA=; b=AYc6Qqoxg9UPks
	auCcejrX/3R+BIvRGEo+w9OOR/9UUkni3SN/fTjFA4Zj6Zu9pGu+S8AWwYt1Y6wsCswkFIYQ4NVw8
	4ftY9GLc+mWRifKta9XuCV6Xy9CHcNRR4zZZtyPMn9Qy++Pe6I53PzHRjLhbaWLF8LfcDuiD+uei7
	3UxNy7jnLj9dBrmdwXM26HO+d09RY96T89NFJ71YOtnjJqtzkXq1baKGUsMZGFNsqxZbew5f6lhDV
	TEtqhsPkF+U9L4kxhmXtkl68TC2CqaBxeZgsOZtJ0dpQ85DUe9bD5GNS/svMEGlp4nAIylPVaFR3+
	3cKKGRI4mFpRXJqZW95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9f0f-00HOCv-Lv; Tue, 18 Jan 2022 03:18:13 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9eT1-00H4pS-I8
 for ath11k@lists.infradead.org; Tue, 18 Jan 2022 02:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642473807; x=1674009807;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PrVHd6y6YErrdCOb2kmQgfctxSWLBf4UHgiQ5pCMqD4=;
 b=kFLUvdrKoeKn5fb8Nk9BU8haRCzYAiOAEcMcwLPG45POFnZc+S/rn77y
 UxziYWxaoLp9YtwBmRVdkJDzUP2fM4TV0aMDr2XCGfH6IZKqbfUCzCybm
 DVijEK+3GFsytH55ccFQi3QlGqlR3/uJ10vS+tB9mhm/FfgyjEfhJvKsf Y=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Jan 2022 18:43:21 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 18:43:21 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 17 Jan 2022 18:43:20 -0800
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 17 Jan
 2022 18:43:19 -0800
Message-ID: <6ac56fa1-b369-831f-2b1d-9a188b7cbacc@quicinc.com>
Date: Tue, 18 Jan 2022 10:43:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] ath11k: set WMI_PEER_40MHZ while peer assoc for 6 GHz
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220113023145.14292-1-quic_wgong@quicinc.com>
 <164242492251.16331.2627237965817574376.kvalo@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <164242492251.16331.2627237965817574376.kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_184327_698751_D033AF37 
X-CRM114-Status: UNSURE (   6.40  )
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

On 1/17/2022 9:08 PM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> wrote:
>
>> When station connect to AP of 6 GHz with 40 MHz bandwidth, the TX is
>> always stay 20 MHz, it is because the flag WMI_PEER_40MHZ is not set
>> while peer assoc. Add the flag if remote peer is 40 MHz bandwidth.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-02892.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Fixes tag
>
>    Fixes: 2cdf2b3cdf54 ("ath11k: add 6ghz params in peer assoc command")
>
> has these problem(s):
>
>    - Target SHA1 does not exist
>
> Did you mean:
>
> Fixes: c3a7d7eb4c98 ("ath11k: add 6 GHz params in peer assoc command")

Thanks.

yes, it is.

I see you have already changed it in master-pending.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
