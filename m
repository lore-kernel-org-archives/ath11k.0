Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4396C433F5
	for <ath11k@archiver.kernel.org>; Fri, 22 Apr 2022 15:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:CC:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c7JiBaj4yNjaoxoS+F1vm5IWuQu1hNl1s/rBEIy65xk=; b=X/5gVP3/4n1joB
	XYx1gaFOMQClh7c7H7CQAkgbwtYmrfMFGLWEXSLbXcNw29ArmJsNNUtoD1cLgL+H4cPugiUzQVJMT
	3lo7udDRFe21UjoT8+++E2apRXcS4LC3DAacO/4njX/YSWavVSDBIXIKutu/TWCgfx4S7u+b5eRAM
	hTyKUtbi8YmcVI2EoxQMxCUc45YPXhDECb0qy+SwEEji+wXJVTjLVvUkd/8DqqXz8OkP6bVyBvTpm
	bGkNQ8B3l4ctXVmcmRm2IU3vo/mocQ8VdX6Vl0DkpG8Llp6nah6iR7mwB3oMmTf6boy37x39lD05u
	N14scgqQCxgHVSohGuOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhvUv-001Chn-50; Fri, 22 Apr 2022 15:47:05 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhvRH-001BAz-PZ
 for ath11k@lists.infradead.org; Fri, 22 Apr 2022 15:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650642199; x=1682178199;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=lxM95/aQeE5qaJaut3rvZiuHxhgzsNr7ReRGoapWUj4=;
 b=Ptlxl/MSLq3ASNEShHbnUP0vIlZItx1ugiFAqkvs51iXOuJyk6AfTQk6
 WfIQrFN1OZicdcNUIZaLGGybRV2cboR5RGvxskzTsy234o34WyVqvd08r
 /pwsD5Vskl5sV0r8xA1KSE9NsWYQgFhMvXUmMt4hiZAZSuU26/8GgO3k+ M=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 22 Apr 2022 08:43:15 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 08:43:15 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 22 Apr 2022 08:43:01 -0700
Received: from [10.110.102.227] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 22 Apr
 2022 08:43:00 -0700
Message-ID: <b208fb8c-b7d2-6fe6-3429-a2ca9d7fb59b@quicinc.com>
Date: Fri, 22 Apr 2022 08:43:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: ath11k: does qmi support multiple soc
Content-Language: en-US
To: fengbin <arithdon@gmail.com>, <ath11k@lists.infradead.org>
References: <CADP2NhYqHncUxxSKeWahYuVV98fA2BrWt7A486Cwu8pzQrqwug@mail.gmail.com>
CC: Anilkumar Kolli <quic_akolli@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CADP2NhYqHncUxxSKeWahYuVV98fA2BrWt7A486Cwu8pzQrqwug@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_084319_934758_46D316A3 
X-CRM114-Status: UNSURE (   3.45  )
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

On 4/18/2022 1:37 AM, fengbin wrote:
> Hello,
> I have qca6390 and qcn9074 both of them works fine individually.
> However when I install them together errors show up.

This is a known issue. A solution is under development.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
