Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29319D3A660
	for <ath11k@archiver.kernel.org>; Tue, 29 Oct 2024 14:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZmo/McqSpLcIptNy9yv9fDZlhygSzER86/5Nb6iaLY=; b=AblEzBJfDHGcy0A/dQqrCa8/fL
	oAWfg8zHqxddQj80VX+48yZSfxkcVT0d1tTEUeJFf/zroX25On5un/0VjAFFgLtsjtGagtsSGtgX1
	YOUWUDjyftCE59m4MrAaLmJ7TFSIG6yzLeSJH5P+7pCMweSrYKblZfrsnjBbJPkeiIhmSUvQ5y914
	De4AzIJWt0IY+ZKWsoBV4iKrUpPOMRPbiMnkP8tK+vBoYj/f7beaTh+mQvVe3hDYMzuIX52gudfDo
	1OdAx2TAYVTMfiYZq/8yxvoFDqtNQjsuAkiMz2CtR7dqL/4d33UM6yfZvDltllhc5EmTilhkdMuYn
	Gj+Oi3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nDh-0000000EjGx-1hdA;
	Tue, 29 Oct 2024 14:29:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nDd-0000000EjGQ-3pCX
	for ath11k@lists.infradead.org;
	Tue, 29 Oct 2024 14:29:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T9jjD7014001;
	Tue, 29 Oct 2024 14:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pZmo/McqSpLcIptNy9yv9fDZlhygSzER86/5Nb6iaLY=; b=VKjAXvBM5cW0RWIy
	iFPTvVg5J6cO0+RgSovgLnYgDxqP8R4bXUUcl0AHF5EFXkYKb4eW1wXFKo2Ly6a0
	61HrnG9n1wzm4kvTKhuS6JS/ZvWKPAW+7BKQj9Ho50YqX4EbYPW61LbgsXKte3Ir
	HGMNmc1dTBoDfQ9ILOscleRejGznLxIE5c90VUd/QVSmP76eEm/ms5cxhGxSQN0z
	TK4XimSgGuOgPDvS1NK+JNiFUeIidulo7gCGewLVIFLcqvIjArGKKq9aRwp+IPWi
	1FSvOQtbFDnnTxrDr6bpUpsrcdh1l3bt+ngKALDiGWDo1KYhAD2944/azQ2j6HMl
	928s0Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqe60kv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 14:27:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TER1TI012647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 14:27:01 GMT
Received: from [10.48.242.156] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 07:27:00 -0700
Message-ID: <24ca263a-e367-457a-94c4-f1204993cdfe@quicinc.com>
Date: Tue, 29 Oct 2024 07:27:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ath11k: remove error checking for
 debugfs_create_file()
To: Julian Calaby <julian.calaby@gmail.com>
CC: Kalle Valo <kvalo@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>,
        Jeff
 Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>
References: <20241025064235.382-1-thunder.leizhen@huawei.com>
 <87v7xcgwb0.fsf@kernel.org>
 <ff8c3443-3651-480e-956e-81c7d592099d@quicinc.com>
 <CAGRGNgUmdKfWxOSPyj9Ofk8ULyPX0j61Qnrd_ckLAy-a0RhdKg@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <CAGRGNgUmdKfWxOSPyj9Ofk8ULyPX0j61Qnrd_ckLAy-a0RhdKg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cPDzIlsYjN9XVCJaB3iIIPrzYTgp274X
X-Proofpoint-ORIG-GUID: cPDzIlsYjN9XVCJaB3iIIPrzYTgp274X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=778 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_072914_555995_0147F802 
X-CRM114-Status: GOOD (  17.16  )
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

On 10/28/2024 8:41 PM, Julian Calaby wrote:
> The big question for me is this:
> 
>> Since the relayfs functionality that spectral scan uses is dependent upon
>> debugfs
> 
> Why?
> 
> This seems to go against the general guidance that debugfs should
> essentially be "fire and forget" and return values shouldn't be
> checked.
> 
> IMHO it comes down to one of two outcomes here:
> 
> 1. Spectral scan isn't necessary for normal operation so we shouldn't
> initialise that functionality if we can't use debugfs, which violates
> the "don't check return values" guidance
> 2. We should break that dependency
> 
> I can envisage a lot of people making the sensible assumption that a
> non-debug kernel doesn't need debugfs and therefore disabling it on
> their thing, but also it seems to be enabled everywhere I have access
> to: Debian Stable, WSL and Bazzite. So I could be completely missing
> the point here.

https://docs.kernel.org/filesystems/relay.html

The relay interface needs a struct dentry * and debugfs provides that.
And as a result userspace expects the relay file to be there as well.

/jeff


