Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579E1C47077
	for <ath11k@archiver.kernel.org>; Tue, 16 Jan 2024 20:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ReoGPfYklfwCZlaqdmEKibjC0wze4T4BY193JwG4r4=; b=3WfW2D+5LAJ8sXgbEL4x3ClBed
	UwXt/YMiL3wEHeU0l3xKhz6RBbjcyaBnHx5wMYl0eEz416TryPIsbW1APKVCME0DBhSvzWns3g/Eo
	f3X9VVcfEegU/RvgpfSZkpybHL9ZqWBWDBUC/kF+bL9FGr0p2iG4HjshAR3eshvJYaxf5u+9Wov7V
	xD0MCL+FtzspQ9hpii2wuK6iqPKfqw3WoARYlwqKdLdXUAOB/rZscHgZ7uFWKtN+My3boscj1iwvs
	7hdefhxAggKhIkYPgwHJy/ybSnHjtaAf2wEZl41OVwO+4nYwNj1Yym4vyHpTe+4oFFx1ZV1ZjQCAj
	15zp5jjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpfn-00DLn3-04;
	Tue, 16 Jan 2024 20:04:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpfj-00DLgh-1a
	for ath11k@lists.infradead.org;
	Tue, 16 Jan 2024 20:04:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40GHtivH015885;
	Tue, 16 Jan 2024 20:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=4ReoGPfYklfwCZlaqdmEKibjC0wze4T4BY193JwG4r4=; b=Zy
	iXSeBdoYAUyYrJozQwtyUk5UeoifmWtPOncDOrOZH+No+yjQMUb4DYWjtPYOtZnx
	gRCJvw22AwvZE+v/bqW0xuRq+KUtDZViIHt3R7QRWWrYfGwpxVxTGmseyu26MpDy
	9M6bzQ++9T5+AlanbY1KrwxwJLP5Q94sjmduhIbqxzPDw2WH1InOMHqMkQof5JFo
	sw/vbOqF+XUuNVBdhEFm1dx5oqk9Id3SKqMT5LsxyvIsHf3ZpsHbGPegnWXvTngw
	q+b1eQVX/3hfegirQ7RaZCrg15DtfnjE0MCbw0fQgMvT4zNehnBU0tRWYwvDjbQ8
	zyMZ/ZuZ3KMkVo1JN/cg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vnq4t1kev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 20:04:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40GK4Ouj020803
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 20:04:24 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 16 Jan
 2024 12:04:24 -0800
Message-ID: <f3822735-8366-47b6-be78-af09aee0307c@quicinc.com>
Date: Tue, 16 Jan 2024 12:04:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: do not process consecutive RDDM event
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240111071406.14053-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240111071406.14053-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Q6hEjz6xJjNdNu5AOsG4nepxsXNe5Z2x
X-Proofpoint-ORIG-GUID: Q6hEjz6xJjNdNu5AOsG4nepxsXNe5Z2x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=655 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401160158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_120431_685221_43C3590B 
X-CRM114-Status: UNSURE (   9.36  )
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

On 1/10/2024 11:14 PM, Baochen Qiang wrote:
> Currently we do reset for each RDDM event from MHI, however there are
> cases, see below log, that we get two or more consecutive events, and
> it is pointless to do reset for the subsequent ones. What's more, it
> makes reset process more likely to fail.
> 
> [ 1502.115876] ath11k_pci 0000:04:00.0: boot notify status reason MHI_CB_EE_RDDM
> [ 1502.115884] ath11k_pci 0000:04:00.0: firmware crashed: MHI_CB_EE_RDDM
> [ 1502.224041] ath11k_pci 0000:04:00.0: boot notify status reason MHI_CB_EE_RDDM
> [ 1502.224050] ath11k_pci 0000:04:00.0: firmware crashed: MHI_CB_EE_RDDM
> 
> Add a check to avoid reset again and again. This is done by tracking previous
> MHI status: if we receive a new RDDM event while the previous one is
> also the same, we treat it as duplicate and ignore it, because normally
> we should receive a MHI_CB_EE_MISSION_MODE event between them.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


