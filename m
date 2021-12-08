Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02032C433EF
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 08:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZI8KujBz8dCDoT6MPBmUf9BXII+avi7h9gKcO71UTw=; b=XtnpyNTDgZ0zln
	LB8vQV3c8QPevTO2OJxIIHNs9Ff1Uv8BOJbEm4UeM8G4wDdKrsjAzRNuzhZmlNzFfzOUmuCu9KuvO
	B7HZjLsMo9IsC1ZjCXjzFNLi2CXx6rbWcJGQkjSQl+06zX3DP6goHBOMWJe2AgCg8lUExmjxwQxev
	z+VMkt7vFjPHV8ti5th20r7DclMEk6KYJsSknHn92PY8fPpkELNbgUq0XZocpXYXoPB8aylmigR0F
	vrO53WICHYAtTu4Tr4xQbFHXfS4h5xkQ80cZeHky4oVMmDBDyNmcn2V1Ptw/n3M73dMt4sHr6kOMu
	bsiX9rkkvLI5qqH6PUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1musAq-00BgJa-0Y; Wed, 08 Dec 2021 08:19:36 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1musAn-00BgIl-D1
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 08:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638951573; x=1670487573;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AQLk6FGdAOv4GB5ViUS7ddtCiscd01jYhDNM/LUKU8g=;
 b=oIoQN9gc481S7lMcniYhsMIapxCP2toFECSzd+mbsP9o5qzHuCV7AOoL
 L9MKi5fGb+vfrbXRHP3LuG7cc5RTOtaZsQY4dyjW0EhYJ1SqT+f9EQdhn
 JMB1RddYbk4Iok3Wskm0ojtbdUg6lanb81Nl8HwXOlqZ/c1OQQhuF1iow w=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Dec 2021 00:19:32 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 00:19:32 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 8 Dec 2021 00:19:32 -0800
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 8 Dec 2021
 00:19:31 -0800
Message-ID: <463b4075-e98f-d51a-d305-a7adadc8a585@quicinc.com>
Date: Wed, 8 Dec 2021 16:19:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] ath11k: enable IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for
 WCN6855
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20211129101309.2931-1-quic_wgong@quicinc.com>
 <163895135713.29041.4980786229647025244.kvalo@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <163895135713.29041.4980786229647025244.kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_001933_503055_A7A3636D 
X-CRM114-Status: UNSURE (   2.34  )
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

On 12/8/2021 4:16 PM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> wrote:
...
> Sven, after your memory corruption fix is this good to take?

After Sven's fix "ath11k: Fix buffer overflow when scanning with 
extraie", it will not happen kernel crash.

But it need Sven's confirm.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
