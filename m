Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D06E9D40F
	for <ath11k@archiver.kernel.org>; Wed,  4 Feb 2026 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWI5AJlNAnvfz/taRLPRAZ7YALDyt2HLN/WrF2WY00A=; b=wt7teHw1YR4z9Wu1wAXsgU+48M
	fvhC3GKN6nThNWGysYEB3bqPOxfsAbBrASMylSvcNQzn5tVPR6HMDA679fIbOe8cCpCj5SP7V7Qcn
	81L5xg2qttHXPO1L6V+BLT27VUNvHcAWt5m1EOGhh/LIDDhIK2TSeW8HgArrtmSfUgW739f5Wf+1x
	uX1gJM3vcfAfGHFUITETum+QIfISnp+KvHJvDa2Qda4ZzrEhlabK5N02n0PW7gM5cTUbMIhdRB2tY
	QGMSpROtIE7kq5x8Llp699PpAR4balGD6j/3I0W8bFod4f8SsO4426s/pjZCPKfmlhv+bW4bH2OrR
	tu94D3/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfuI-00000008m9K-1NoO;
	Wed, 04 Feb 2026 16:39:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfuH-00000008m96-0Vbc
	for ath11k@bombadil.infradead.org;
	Wed, 04 Feb 2026 16:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wWI5AJlNAnvfz/taRLPRAZ7YALDyt2HLN/WrF2WY00A=; b=NMHhsckYPMb5W3I4LKgRAinAKT
	yVN2vCG/YICNAi0bnXndenDyb7+C99pBrqxPOVblYCagrLZ2b/8x93o77lLdccUiJ5+pO0K+G2A7W
	3J5N3Ky8z0FUfPm38t4FEP6wcAkxOJh1dz1IHvX4QULCV/YE7wqmiwgEgKPnlaqZU7pVDt4Lg6T4c
	R3PR25PHI/B9qCr7AoCc2s+5QoUn8Jijjgpj2FHV+6/MUM5GMyliRI9OLDwrosw4JEegsuA1PvUeW
	5P8WLLTKGqypfjNPh92IKK7EqMlfGkHzc6X9q9XVtvHgXXeGoPHvvNW39etEexWiM0uzeH3Nayd5H
	yXtlk7fg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfuD-00000000toR-2ONd
	for ath11k@lists.infradead.org;
	Wed, 04 Feb 2026 16:39:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIUc02163245
	for <ath11k@lists.infradead.org>; Wed, 4 Feb 2026 16:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWI5AJlNAnvfz/taRLPRAZ7YALDyt2HLN/WrF2WY00A=; b=B4jOanNwl41ERyxi
	fLnrU0piXao1XvKAxV9/HD5bZnyMofzj0isIFHDS27d/Bd1N+8/zGzSN8bDUmPRv
	OPW0uw1H6ekLbUQ7io9qQLbVyJkayXl+ZXQmBMg/eFhXWr/d+4PSerHxYgHMmnVW
	N5awcjA4Yd8tzctNv1pioVKX7eE2fuX6vYZxfxFBxHdJ/J3Iw1sPwFHt1+vcthFo
	J9GAN41sR81CEtLmsto05E+ZN4LnXV0v10Nwg0hd8UyRybEbnaA9Y4/fWN1xNKLf
	DUMwv/7f1HG6A2rkCbnZuff6Y7n1TMyibZTwFF2Q/WPdF22t5gAxkTAl4cydJQnG
	0KGeuQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c45nvgw4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 04 Feb 2026 16:39:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b8295e5703so11165426eec.0
        for <ath11k@lists.infradead.org>; Wed, 04 Feb 2026 08:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770223139; x=1770827939; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wWI5AJlNAnvfz/taRLPRAZ7YALDyt2HLN/WrF2WY00A=;
        b=GFYQKWHbqAXpVby0ilGY1VSBaRqzdJtOAL6k3sNdRlCX7BLS3I4Au9EUiwB4TswkQg
         yckKWfIFf4OaO2S4rPA3R8chyhvGVh8S365IYz27QRhpcek+qA1LBT/olU33VGzDnIot
         K3IyXU5F6JIvHYoRpO1Atrh7ObcyTSg/sehv/1F+Cu9wv69epbDbu/ssVC84C9wo2eja
         BytZpJQzuDMJwt+n7ARwfasKEfAnwWnw25AdcOMWXm4PnpSitVAfeKGgTA2L8UshbGjH
         KLWhMroI79Qd5YqQJJ+dj70yKIphPoR7/g16xuXgB46eTqmzUsAVqd9XZql8O8U3P71G
         +cnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770223139; x=1770827939;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWI5AJlNAnvfz/taRLPRAZ7YALDyt2HLN/WrF2WY00A=;
        b=Bu/CnBHJmhRalyqRo6z8smYKlKsSGzhFuDr49Y87k9l5BCmC6q/7KXdx99Ntjqu/R0
         2sFkv7hmLeLHQhYNaxa3+Vcdgv66HUBVuFmn/6bpRDVmYjfEaKZahUhZQ7sDTfL7jSTo
         hsy6e6+ylXe++cwx7zzIpD7n2xelxZyzZElrtFEjGuSez8j4OIVe1tAvYjkPn/5bJyW4
         61iKEx9lf3Ug43jzwOQmIkJQDQeP966PSoO2T0Zd6HxXeKTYPr7IiITg6RlTqYtOHgrK
         2ZZJWk8QZ7CJId/dlGmUbJenYTJUeuVOF4tzSzErmolC5Ie2lEuQ6kkUK2gOtXjOHTU9
         3OLg==
X-Forwarded-Encrypted: i=1; AJvYcCVZHHPDS296Ez6+If2s193Y/lh6HECZLQdM8Wd57IY7oTNVf3SDbTz7irmtxk6AbeA8tyuTYqc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTXE+kLMZdj6kwFSquuFwgju4kIeSK3lh3jkRf6VzHcKuptqq2
	lmjWDRDT7i7SCyzHmT+ns9OZkXawcF078ueXawLOpSBDakb6nv56Z2b62jFYPaF7dIMFs2sqPWZ
	epDSk/i54CH7kmR9bRxDTuLKOOnZCL21s0Htd2kLho+0ATbMc16geIjfxpMNH/W+G
X-Gm-Gg: AZuq6aLsXIOVrc9jrFaovR6lSzL+uaMKATHWExwl65iQJtHYAA8kmt90nwR9CT3cwwA
	/SNSL0u2e6RvIANXUheJgp1FaJZZidC/hTNXgA7tkaf/iOQXBKHlmxoTJx8Zifr/VpKpx35eIqg
	F0yCgn0peWTpiQIX5kRlbUREPxS42pPMJ9Xj8T+oWPBQDN+QBD9PSkgD8T3LkENrKdBlcmKiCX2
	kRUcONhbpVVH6M0OI3bLW9EzR2QVh+sJyf7mEqic24L5UUZLMZzhfPNO3R5pFpCdCJ3M4Ra48GJ
	INoSqqSGqIjNz4F5fAIbIiG43LOweTgd5RkUv9Qwy+os61mBftf1E1puq+Zem0A+jh9lSXS7Jss
	TJWNFnAGvR3SQ24QMHD81AiGaPE6ra528AO6Y6mQSJSrq7Mmq8QEiIPEeTN0k+EVXIcIXug==
X-Received: by 2002:a05:7300:e613:b0:2ae:5a13:97d8 with SMTP id 5a478bee46e88-2b8329901e3mr1478770eec.14.1770223139396;
        Wed, 04 Feb 2026 08:38:59 -0800 (PST)
X-Received: by 2002:a05:7300:e613:b0:2ae:5a13:97d8 with SMTP id 5a478bee46e88-2b8329901e3mr1478753eec.14.1770223138807;
        Wed, 04 Feb 2026 08:38:58 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832faea55sm1849503eec.23.2026.02.04.08.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 08:38:58 -0800 (PST)
Message-ID: <876f4ba1-7bee-422a-8f5a-b9ea56dddbcd@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 08:38:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Potential firmware selection issue with QCNFA765 on ThinkPad P14s
 Gen 5
To: Mohamed Sallam <sallamx99@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <CALOnm7APGpVWcx45O78fa4hOCUGDc0-ywGoqicr51YtpxNueLg@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CALOnm7APGpVWcx45O78fa4hOCUGDc0-ywGoqicr51YtpxNueLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyNiBTYWx0ZWRfXxccLLv2uC047
 cIO28fA0o+QA8Q0tI323Ml+5dYe5k/rttksAEIg9PE7LFx9e9RJZ7xi/9tDxjwome52hGfZ2J9B
 jmw9MmXmGRcxjulycst94UdYxhB28RawDCvidpCoOwLTzQz8yD7hpZ8jSGULANORE9Euh/uuf2G
 LhO5mwMznM4Xg5hmiFNXbOk5FbmsOmSCoTV44tzFbJSTLPYNewsp6zRCeSNmLYx6cWoCe8T4n36
 8GlLZFv8I3qqecCIT0VG/PJ7qFfwXqBHaywCiD0IbmBFp3mHvYYimlxod78ZQPNjWz2MHOzH16/
 LyH0POYw3BZ/HJR/xXWNwQWGODXtTEJ2Y2wbc9P69i/lyCw78Z9oKZ1xpWL+/JD+ajDyw8jou+H
 P4OgyYZE7aLly2+SGa6iSTgTGupSstDIdP9LvPDm1O1lNvIfylhSjfLi0Adfg9X7cQLc7mlhJy+
 hcMlRjvTw+P0IT84PqQ==
X-Authority-Analysis: v=2.4 cv=DLmCIiNb c=1 sm=1 tr=0 ts=69837624 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=B7CBbNVz23hr-bkFT78A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: cRX1s11zprQc1XyG1BmW0EuDDyjUbPHS
X-Proofpoint-ORIG-GUID: cRX1s11zprQc1XyG1BmW0EuDDyjUbPHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_05,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_163906_164318_2A5667E2 
X-CRM114-Status: UNSURE (   8.60  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2/3/2026 10:54 AM, Mohamed Sallam wrote:
> While trying to understand why this happens, I discovered that the
> linux-firmware package contains two different firmware files:
> - Generic: ath11k/WCN6855/hw2.0/amss.bin
> - Card-specific: ath11k/WCN6855/hw2.0/nfa765/amss.bin

In addition to what Baochen already said, I just want to point out that this
NFA765-specific firmware is meant for Internet of Everything (IOE) devices.
This can be observed by the firmware version containing
QCAHSPSWPL_V1_V2_SILICONZ_IOE vs QCAHSPSWPL_V1_V2_SILICONZ_LITE.

The generic firmware is the correct firmware for your device, and Baochen and
team and working to fix that firmware for your issue.

/jeff

