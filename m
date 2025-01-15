Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85D4C02183
	for <ath11k@archiver.kernel.org>; Wed, 15 Jan 2025 11:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6TWdJkF3Y1ubZwXE/wBzC/CRLynck9u4qE88briiAA=; b=dPauPajlNzTs8U296wrB0oZIih
	sfatV4nweWmcXEgMBRBQhhNgw4H1HDEH9UxMq3OfGVb056bn8coJN/KSchZVADxHG2PRQsWok90JL
	i1E4oh0t+cGyi5xGJlq1Hcve8vz53o+rRn4y92gUcySCmjNQ1JJTO2D/mc7Nt+wHhGgxbbYjQ/uN3
	XAI32gMHCbrj35gCiqnBp1PF1hVoB78wut5vOhSyfe0HdmmmHqxdZUaJDAzca4zCV3BR6xXo0Xxqp
	w+4qDcCepMLaFms4zIaFE9lUpL5pmjAhoj+UKSka7cbxAZtvvweverwFofjJxoS73B/MMjHYx4J89
	mmRkhRGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Tq-0000000Bf0r-2Dt2;
	Wed, 15 Jan 2025 11:22:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1SZ-0000000Benr-3CIO
	for ath11k@bombadil.infradead.org;
	Wed, 15 Jan 2025 11:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=G6TWdJkF3Y1ubZwXE/wBzC/CRLynck9u4qE88briiAA=; b=AV5g9mGQYT4r5qcJYCtJReMsXY
	RNh3HxjfeSzz7RRHyDx+Dm0gZPhlmyLS9Vc4wigZfhxgMsYW+vYH9ofccnG4YoQSpnLbiLptR9YcY
	4bVP0mNr+dwOzBiwslbeWCYLM8cJ9UxU/Blz+Ak9USSpmiRTJzVudS7Yqd2AlIbjdF/tXmBfUxLGD
	QqANUr1xtLUaXYStzwH1ZHxwRmgNwM83XehWFcQ/9Q2NXgPNDyxtua0NHeevqvFDjqSMYUTXQJldZ
	jwq0nyn7UQgvm04bitdTUukRDhplOvULrpKvgSXjAzPyFwzZcbWQFT6/ciFwjlCWEIcxmGkEbHGDv
	s/UtGISg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1SW-0000000Ar5o-1gW1
	for ath11k@lists.infradead.org;
	Wed, 15 Jan 2025 11:21:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F5mlD1019020;
	Wed, 15 Jan 2025 11:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6TWdJkF3Y1ubZwXE/wBzC/CRLynck9u4qE88briiAA=; b=b5K/NmBC3cBfiDAS
	f/RbzM4JswcMLqVhQk9XfUhBJdq9fz8QKkoVKpqD7P0fqA/Vy1dDGb/V3dmLYcHg
	/xaw6+h6mmwYBzZs8rW8hr0LJsqfOJ19y4T0YMG2qSvcsYdi6o5BJR27Z1gA9VOy
	hpFxBJy+skMwczI7bZk82wepWHPlV9uEi79UlCXcEKaNIdYiTBhlD7E4e34VC05Z
	tgq888Y4g10fKIcih0VLkLf+yluj7/JyWVBf6xETi/OKErrTWlTzVfimaNQuvBBl
	B0PZkGqtyC8Q/ak/sdn0rXSnW/yqLvjzX8X/OMyMzcKvxkARR0+OSXWM3nH/0swc
	w9ytyQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44676vrtuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 11:21:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50FBL3IB009351
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 11:21:03 GMT
Received: from [10.231.195.16] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 03:21:00 -0800
Message-ID: <4ef22e4e-1ef8-4c16-ae01-06adf23415f8@quicinc.com>
Date: Wed, 15 Jan 2025 19:20:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations
 are supported
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
CC: <ath11k@lists.infradead.org>, <jjohnson@kernel.org>, <kvalo@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
        <quic_cjhuang@quicinc.com>, <vbenes@redhat.com>
References: <1090a0e4-6a19-422f-83ad-4566e5c86015@quicinc.com>
 <20250115110621.134716-1-jtornosm@redhat.com>
Content-Language: en-US
From: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
In-Reply-To: <20250115110621.134716-1-jtornosm@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UXBEBmyVQqbZ-IibjGRUwSju5cX6qDES
X-Proofpoint-GUID: UXBEBmyVQqbZ-IibjGRUwSju5cX6qDES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_04,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=650 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_112116_847051_0AE83867 
X-CRM114-Status: UNSURE (   8.36  )
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



On 1/15/2025 7:06 PM, Jose Ignacio Tornos Martinez wrote:
> Hello Yuriy,
> 
> Buff ... again the same that was already in the thread ...
> As I commented, if you want to have a common interface combination, please
> go ahead with yours, and then we can see on our own.
> 
> Thanks
> 
> Best regards
> Jose Ignacio
> 
Yeah, as I commented, the common interface combination can work, and 
https://lore.kernel.org/all/90c806db-9d75-4c25-88f5-252da80b5d40@ionic.de/ 
also help to verify in QCA6390.

And just I saw your email to me ask it, so I just wonder what's issue do 
you meet. We can find some from your logs.

If you want to check it yourself, pls go ahead.


Thanks,
Yuriy

