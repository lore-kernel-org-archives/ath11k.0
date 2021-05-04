Return-Path: <SRS0=LAxC=J7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FA3C433ED
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 17:31:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1F22613CB
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 17:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1F22613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r0b31olEeB0+oVejZqUdWjH9zepG8S4O51/60FqEJTM=; b=BT5vKh3Vc05Jb26qEhxV4q76V
	/iagkvXT/4A3FQbd1rDXVO6lNZHpvfmiJOSPmmJFvL+Rio4n6Flk7vkKMMwWVktWieBna1PwCF1Lo
	JqXqQdUIO74Jp37OhfQZTyLTKap/JHbok1K7msUcuoWPpRR6eU4zM88mq87LrapbFy8FT59518nMH
	wSAMrN+Q93ISU3W1hgBM8KvvQTrhhNGmiJdjtTeuLY3jyoAGFNA61x0gelddErKJYARhWX7Ga2kPI
	Ady7coK8ol1JNmMFqCuK4aHunRR+rTtFfJe9ikomET6fkpsptRsN9AOlI4oEYk5/rUH2TAJAoOZHH
	dAb1FGCbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldyt2-00GfvW-1z; Tue, 04 May 2021 17:31:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldysz-00GfuI-C1
 for ath11k@desiato.infradead.org; Tue, 04 May 2021 17:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=fglKef9FNFFNSB5z6laa2PVSQNP2ntNCUYUI6ccXT+8=; b=DrkFdOzUqTUNWu+S74XCb8ZRlv
 ymDfogBuxKUgt8mnjsAtiuC9Uxyw3/SZPE5OIyrOPWI3rWDX4N8FDhbLmhAX5LddiexbB5Ys7DWvx
 YevktDCNeN0wIly587Ucwt614BGGd1C/oPY0SK15d5s6ZdoD2ne/pYNE6kUG6YRGpDKIbd+a1DOGq
 aTQ2/lH6ncYUdsZjrQAaGhZTUHabPWCgRJCS9S5cc9/rdkPMeJ2EufRAj00P8Oc/R/ToXzVoABgiu
 eVHNCu3+DX5cLk98G4ytTTrPHJ+Yyn81R8p1og1hOVMqL9YuS40BQk1RSIZvsUx1gb6BNMbiuho7J
 ttL92YLg==;
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldysv-0048qn-EP
 for ath11k@lists.infradead.org; Tue, 04 May 2021 17:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1620149461; x=1651685461;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=kUkLaDmx5xiOhOJgVVgmvn9X6rgPLk+8NgVi3a2xkj0=;
 b=QQBErhKfo2HGSOBdp3IoVsEyhzzyXhSEeunBObdRfCuSlNkpjrXfQsp/
 65HwPTYiCSvQ/1fmjOTb2jIfhSVvndxabZUVFJasw9jDeJv+6tJfZJwzJ
 Pv8EfqnrweP/34rsvRXu7OAaM7QXqEdcFa8V/EoyRt41yxUBz1BOBJ+Wi M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2021 10:31:01 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 04 May 2021 10:31:01 -0700
Received: from [10.226.59.216] (10.80.80.8) by nasanexm03e.na.qualcomm.com
 (10.85.0.48) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May 2021
 10:31:00 -0700
Subject: Re: [PATCH v1 6/6] bus: mhi: core: Add range checks for BHI and BHIe
To: Bhaumik Bhatt <bbhatt@codeaurora.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <hemantk@codeaurora.org>,
 <linux-kernel@vger.kernel.org>, <loic.poulain@linaro.org>,
 <linux-wireless@vger.kernel.org>, <kvalo@codeaurora.org>,
 <ath11k@lists.infradead.org>
References: <1618598825-18629-1-git-send-email-bbhatt@codeaurora.org>
 <1618598825-18629-7-git-send-email-bbhatt@codeaurora.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <a5e8cd2e-2863-f88b-8344-021d90a68131@quicinc.com>
Date: Tue, 4 May 2021 11:30:59 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1618598825-18629-7-git-send-email-bbhatt@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03f.na.qualcomm.com (10.85.0.47) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_103101_541929_37018BA4 
X-CRM114-Status: UNSURE (   6.86  )
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
> When obtaining the BHI or BHIe offsets during the power up
> preparation phase, range checks are missing. These can help
> controller drivers avoid accessing any address outside of the
> MMIO region. Ensure that mhi_cntrl->reg_len is set before MHI
> registration as it is a required field and range checks will
> fail without it.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
