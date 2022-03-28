Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E19C433FE
	for <ath11k@archiver.kernel.org>; Mon, 28 Mar 2022 09:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIY60QdUpnl3YD6JifcxwdUsQutl4zJhXY4ZGB0XhAk=; b=AoBPnYHmo1J+gJ
	u91hIkidqaAZ+Sh02OHWpozJJ51rgTBXV+kc2heiWOs/HsehwC7QXRcxljKzRJhJeBKzUc8ekb3RU
	l96wT9E0NtnQu2unbM51dW2b/ME6xe4jrE6yWIqVyK2DLbA9IJEZNwJd8UJ7SdCsit55yLXYVKKIk
	4JK6Og9T9ORO/z+fQftyUVK9VHdgZH/iTQ93IMA852YZL0pkqJePmQUXaOxJKck0D0BCaBf7xisX+
	5ZjxSOb8WBufr33bn1w/qO4cbwOjEXyFh4lrCdvkYywZEojEU2hyp0Xhzgd47hp8UHKMIQulPGpgP
	eKb+wVPb0vZ2zSjZNU4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYlxE-0084O9-Tx; Mon, 28 Mar 2022 09:46:28 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYlxC-0084N9-6Z
 for ath11k@lists.infradead.org; Mon, 28 Mar 2022 09:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648460786; x=1679996786;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JTdvB25vUbJnyw0JBNaG2yzKb58PG7OrUvyC9AmRFz0=;
 b=nov/SFZP9qSvlUJMnp5r9P0IVAsvcxlrDIkLpuAhZVmyGKLzhtDOU1Y2
 fiGawXDfA36SwK/jtOz0rlY+Vc1kLi/TR1vLpdflKnczBEh+LRt+VXr9r
 OBeBTkdCbQtITKw8fIf8QQ3x/uKstwmOQMrLoJekP9OLgDu5Bh35A4crB 0=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Mar 2022 02:46:24 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:46:24 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 28 Mar 2022 02:46:24 -0700
Received: from [10.50.8.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 28 Mar
 2022 02:46:22 -0700
Message-ID: <60ab8224-9d92-bd55-5f8a-ede5e9485469@quicinc.com>
Date: Mon, 28 Mar 2022 15:16:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 01/12] dt: bindings: net: add bindings of WCN6750 for
 ath11k
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>
References: <20220328060937.16738-1-quic_mpubbise@quicinc.com>
 <20220328060937.16738-2-quic_mpubbise@quicinc.com>
 <0256a6c6-088b-a7d5-68c4-b99238bbb0f4@quicinc.com>
 <87sfr2zb8y.fsf@kernel.org> <87o81qzb6f.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <87o81qzb6f.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_024626_303986_7DB1FD26 
X-CRM114-Status: UNSURE (   5.20  )
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



On 3/28/2022 2:49 PM, Kalle Valo wrote:
> Kalle Valo <kvalo@kernel.org> writes:
> 
>> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>>
>>> Sorry for top posting, missed to add device tree mail aliases.
>>> Adding them now.
>>
>> IIRC DT maintainers use patchwork, so adding them to CC in a followup
>> email won't properly work.
> 
> Argh, s/properly/probably/. I blame it on the DST switch we had
> yesterday :)
> 

Hmmm, I'll resend this series alone with the missing aliases in that case.

Thanks Kalle!!

Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
