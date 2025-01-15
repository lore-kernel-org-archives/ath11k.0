Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E877DC02180
	for <ath11k@archiver.kernel.org>; Wed, 15 Jan 2025 12:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NF90EhPkBYJ6ERmHnU333VvDKfrgGInc+0vaF1q/t0=; b=X02/1EBowLHfJsVeYGbvebcq2z
	dcae+gvaDAaZ2mXsd//eXQru2YJbyNy8gDslHAYOv1GDysJoQxKnxvXI6US9bRvq50hrKBDfpy14f
	MJ5GzPIYyw2TbiTFXC4QbQ/xCzk213JdKPF2MabRGrpvnvACnTA+X/UJO4cysWh8uKZGk80LkrGOb
	n982RHuY1LDODmTMSg16FcfkoZAfVr1tCMf4HEQHW2qPzncjorGjuRFOMy1U9Sbgvq0hGKSgQrKf+
	uhA8sQZGjmaDtjkrdfi7P06mJrbld4PaQY0hjjCZfW+QPij5oMpY1g80dpp2LbKzxY+YIpufYKPvk
	Nz8liqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY293-0000000BnEm-1k2F;
	Wed, 15 Jan 2025 12:05:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY28e-0000000BnBe-1sgh
	for ath11k@lists.infradead.org;
	Wed, 15 Jan 2025 12:04:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FAwX7f008660;
	Wed, 15 Jan 2025 12:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5NF90EhPkBYJ6ERmHnU333VvDKfrgGInc+0vaF1q/t0=; b=ewxLHq3/bincRcCW
	X1Sd+kNI6Tvd+QiFoi0M4nWXi1bhrfb/K8S8LoXk6sy/aEoekQihqjFIcvGRQRjT
	vp43YsRzKKQWKlE08/zVSXqf5vVDtv4UZ4vnWiVGkudO+Fimo3D+FQSlFNPbtJ8Q
	pxDbGneogzNLBBBJjxW7xlFjF4e94K7z3AwgAV9jwL/2okzW57stWOmtkl4J5/ub
	OfGBGta8KOgIYvCaNSp5UMpYE5i4df0/xM8XAfAOhbOlHOgX5OybU84aL2uyfYVl
	ScyFH3HMg7ygDjNzde7TwloTVDXS3MAKXEWthO4lyZCH85QHpEjdOVkgK3bEoc83
	fngfaA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446bqx86gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 12:04:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50FC4iWu013729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 12:04:44 GMT
Received: from [10.231.195.16] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 04:04:41 -0800
Message-ID: <d410576f-2fc7-4de1-af51-29fbe8b14948@quicinc.com>
Date: Wed, 15 Jan 2025 20:04:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations
 are supported
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
CC: <ath11k@lists.infradead.org>, <jjohnson@kernel.org>, <kvalo@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
        <quic_cjhuang@quicinc.com>, <vbenes@redhat.com>
References: <4ef22e4e-1ef8-4c16-ae01-06adf23415f8@quicinc.com>
 <20250115115500.136864-1-jtornosm@redhat.com>
Content-Language: en-US
From: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
In-Reply-To: <20250115115500.136864-1-jtornosm@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8fsCAObsBGAHM8FHS4Lt4gqJrIdAmdTN
X-Proofpoint-GUID: 8fsCAObsBGAHM8FHS4Lt4gqJrIdAmdTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_04,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=846 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_040448_613066_F7A32D19 
X-CRM114-Status: GOOD (  11.20  )
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



On 1/15/2025 7:55 PM, Jose Ignacio Tornos Martinez wrote:
> Hello Yuriy,
> 
> It is just a matter of the number of resoruces available.
> But before any further investigation/adjustment from us, I would like to
> confirm that your interface combination is what it is going to be used
> (I haven't seen it in ath/wireless/wireless-next/...).
> Are you going to proceed with that?
> 
> Thanks
> 
> Best regards
> Jose Ignacio
> 
Hi, Jose

If all ath11k-supported platforms pass verification, will use it. As you 
can see, some platforms have already passed verification, and now it 
seems that only your platform is encountering issues, so we want to 
figure out where the problem is occurring.

Thanks,
Yuriy

