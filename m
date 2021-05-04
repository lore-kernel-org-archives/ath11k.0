Return-Path: <SRS0=LAxC=J7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC4DC433B4
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 17:26:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB04D613AA
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 17:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB04D613AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9RtfxxJQv18IzDgvmFAemP8NPYmFdmOe4DtROJHWAu8=; b=NA1wZrzEjnkqpkxx4vY4xFwAm
	Cm+kMckgC7pc0c192M79J0lFdYa8MCQ33e/i9kyRw2TLTjnsoKkme/R64bw/qJboM8pISrK54wZJ9
	N2ZjNLhVsjdQ08qZAl6S28Z+AmRiz9TEtc/okBviGt3jrilH7g079QPAZEOWz++9gxnayKiozsDJT
	WKLzRaTcmxecpQxIvQ+vNeDdHJNdynu+v4zmZ+k58SRhnSNYDloqRU0lTOkdXAMYCDz6FsZ7u+pu3
	69qbetuJ5WTar3akUVTdFXFp9iNoc071P31zkLtFZ8ajX4KLhUlozIezoJgtiX6enwJ22cPbjnFAs
	k3tqDsG0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldyoJ-00Gf4C-Ui; Tue, 04 May 2021 17:26:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldyoI-00Gf3F-0S
 for ath11k@desiato.infradead.org; Tue, 04 May 2021 17:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=0pvNzcZbxcjRA/BLfmASqHxK5Brk6DHoa3GhGbZyjXE=; b=rdvzdjG+UxrLjDAxQ7sv/guGhv
 Jbc3cbpLgpV3DIpCCLrKHFJ2Q77+SPqPEn+p3BUTR8tU0DEy78biz0RocqXq5epn06IZ+vpfwS6I9
 sti2SVpAEn79oARI+hTCVsKA9zI2LGaQNgV7O9zKU/qI6CUsqoj7xhJtOtaXehxa3TakWKBWv6ee2
 kLnf+aTkl53908nb3zTnVUVQjDfb276Y81lr84XhO2PX41Dzmm/H+1HIA1yPWiItC7Zwh590TTOVB
 aCt8Onw6WBmMh5AIUx5gGtWwgbCbt0woVUBDP95YI5sLbO9FhcMkt78RLeDpLpg/CJHkybKU9P92D
 C+iG9XbQ==;
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldyoF-0048hN-Hq
 for ath11k@lists.infradead.org; Tue, 04 May 2021 17:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1620149171; x=1651685171;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=tELHJYEjlyIrHvp1LCUAoAaqANLGV9YKPvNdul3uko0=;
 b=GmYzjcpGasAOHL+DicADV09NyyxX0tUIZg/SNIeDB8FT5njK3nKNzPS+
 xtaaWEzwmJ/NSDXxF0Kk8nfy/TzrOzbNpIjMLCapvvIu8pMmJ82okMsqD
 RVw68XKe9+JiTmugBsxo3+Ks9PNQf49IeAJFK1we2mOG5O/hTo1+GZOxz g=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 04 May 2021 10:26:09 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 04 May 2021 10:26:09 -0700
Received: from [10.226.59.216] (10.80.80.8) by nasanexm03e.na.qualcomm.com
 (10.85.0.48) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May 2021
 10:26:08 -0700
Subject: Re: [PATCH v1 2/6] bus: mhi: core: Set BHI and BHIe pointers to NULL
 in clean-up
To: Bhaumik Bhatt <bbhatt@codeaurora.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <hemantk@codeaurora.org>,
 <linux-kernel@vger.kernel.org>, <loic.poulain@linaro.org>,
 <linux-wireless@vger.kernel.org>, <kvalo@codeaurora.org>,
 <ath11k@lists.infradead.org>
References: <1618598825-18629-1-git-send-email-bbhatt@codeaurora.org>
 <1618598825-18629-3-git-send-email-bbhatt@codeaurora.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <55df55c8-5799-e581-1dbb-8291243bf37d@quicinc.com>
Date: Tue, 4 May 2021 11:26:08 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1618598825-18629-3-git-send-email-bbhatt@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03a.na.qualcomm.com (10.85.0.103) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_102611_647126_AC4C095B 
X-CRM114-Status: UNSURE (   5.73  )
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

On 4/16/2021 12:47 PM, Bhaumik Bhatt wrote:
> Set the BHI and BHIe pointers to NULL as part of clean-up. This
> makes sure that stale pointers are not accessed after powering
> MHI down.
> 
> Suggested-by: Hemant Kumar <hemantk@codeaurora.org>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
