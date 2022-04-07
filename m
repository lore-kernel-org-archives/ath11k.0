Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B0CC433F5
	for <ath11k@archiver.kernel.org>; Thu,  7 Apr 2022 17:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gjJGPCOR/CIgKGX6xKjLG9XMSH0geIlCswCTrdeTstI=; b=reocfSf07cyJ00
	nt69H703Zrr8fR9QLMzhGpMO/G9upQqEmTWBV8Sg1QaeIcTWPWQr25l/AQ1pnNbpsTXeulRAYx4Ga
	CN63Ci6ewx9y75Vudi2OGHU8O+AurG2eRqa0EwoBPVJqAWMn//bh7tTusTeV25ZSnolapFZoGh8iL
	/g6cpyr17vBuVgwfJUQ4nioMDRQeWbdrUhJo1c/C+hyYO6tCP/ASU6ffIx3NMEu1J5qpw363gRiyw
	7Nx7mqqwIEIxxhDAPwsOo9LDznOc+3vT4p+hakTu97gPepd4XE/6fuuznPwtOeHeUVj40ZcMVZmPB
	4RWcADRl0q0hrhjgT28Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncW0H-00DP36-EP; Thu, 07 Apr 2022 17:33:05 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncW0E-00DP2G-Tp
 for ath11k@lists.infradead.org; Thu, 07 Apr 2022 17:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649352782; x=1680888782;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IXVWcl0hnhxIEQ4QyqAnU5kjLopkZrcK3GhuSZDQtD8=;
 b=yDXVY6e1+5+Ouwwzqym2ZHHh1M0y9q35kmcya/Wu6zHM0c/PrLFSBIty
 clFb4RpaBcQM3KhwG5TD8fgxhW4o9ExjkWG6AuoFDUN2EH6rgohqGMJa8
 oIieMFTkpgQGAhWk7dWi/sXBu8SGKg6ZtlZRPMQB4MxtzpeyGOG3D5QAF M=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Apr 2022 10:33:01 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 10:33:00 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 7 Apr 2022 10:33:00 -0700
Received: from [10.234.232.227] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 7 Apr 2022
 10:32:59 -0700
Message-ID: <50aa9416-6e7f-2793-5a8b-bdcf28f5a49e@quicinc.com>
Date: Thu, 7 Apr 2022 10:32:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [bug report] ath11k: add debugfs for TWT debug calls
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
CC: <john@phrozen.org>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>
References: <20220301074905.GA13071@kili> <8735isrmvi.fsf@kernel.org>
From: Aloka Dixit <quic_alokad@quicinc.com>
In-Reply-To: <8735isrmvi.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_103303_034206_E777EB12 
X-CRM114-Status: UNSURE (   5.46  )
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

On 4/5/2022 12:49 AM, Kalle Valo wrote:
> + aloka
> 
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
>> Hello John Crispin,
>>
>> The patch fe98a6137d03: "ath11k: add debugfs for TWT debug calls"
>> from Jan 31, 2022, leads to the following Smatch static checker
>> warning:
>>
> 
> Aloka, you submitted this patch. Please take a look and fix the issues.
> 

Will send a fix. Thanks.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
