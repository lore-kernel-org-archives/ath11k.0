Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5ACC5478C
	for <ath11k@archiver.kernel.org>; Wed, 28 Feb 2024 15:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1R4APKky5KyG7CTqhi4cnxO0NMTC4XM+z7N5ZETRfk=; b=WLboviN4whgcBe8C0+oV2ScSz/
	K/J9Y5e/NJiMaRNO5ikjYS9aK2y30bYRoFY00UpRr2ZglGhyUyFxa3DjK+SEOOtZEwCHDE2qyNGrK
	WgL9m1A73PynBVyx+IYZukwaHKuR3GIcb+POl24Xwnq7itNHLspOdOy4bweFhRfEY8PCCWb+MkE2b
	y7DPHgNNNAuaV+eQJpXI+hG1mukfa4Dns2dw4DZvj52fyzGr9KwqpXg3gfs8ZvOcdA9forn9WNsAA
	4zyLBpcBQfKX5DUcIUYX0RkRbTmqB3Nk5CG27r3fFA2soGfHvxhPrJRIZhwlettSOp1a7ore2yRGt
	prPlIodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfLbb-00000009qSG-3ngQ;
	Wed, 28 Feb 2024 15:12:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfLbZ-00000009qRa-0ytZ
	for ath11k@lists.infradead.org;
	Wed, 28 Feb 2024 15:12:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41SACk0S017571;
	Wed, 28 Feb 2024 15:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=M1R4APKky5KyG7CTqhi4cnxO0NMTC4XM+z7N5ZETRfk=; b=TW
	+PDWyX0BtG7PrQs8mZ1ziwZ5XKYzFZJ/mRqSd8wViWQ5oFQiBLa74ocC5GcZGLWE
	xPHmnQ0G7cKadi5slC0474YZKMV5K3f5qLADaqTVgs13p/NmRwFWq9PzOmPGpTRk
	ajlc8rVFft6yc+DuYM6wdQ/kMFtxAKORUwt7gchZF9LwFwBeG5sVN1IElbShX0pu
	jzw9cTFFDmkzwRMnEzDJPIEfi7Pi6zoiGwpyDa3B73Z7UGsivMA6SsD58LEDnTuk
	1Zh+INcro/i7wGtYdRnQsv9MOjdyNyMXLJIVGIUvVSRa9v/1huPVQwwlP06WENrC
	ni/fR5L6LqLA9awpggoQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wj1d9ryph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 15:12:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41SFCEdj020282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 15:12:14 GMT
Received: from [10.110.113.97] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 28 Feb
 2024 07:12:14 -0800
Message-ID: <ea483a49-9880-4631-a008-a437dec2b133@quicinc.com>
Date: Wed, 28 Feb 2024 07:12:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] net: qrtr: support suspend/hibernation
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>,
        <manivannan.sadhasivam@linaro.org>
CC: <linux-wireless@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <mhi@lists.linux.dev>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <netdev@vger.kernel.org>
References: <20240228022243.17762-1-quic_bqiang@quicinc.com>
 <20240228022243.17762-3-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240228022243.17762-3-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dEm-2-uhJQ1ysMlIdUXYx5sdPC-SkLko
X-Proofpoint-ORIG-GUID: dEm-2-uhJQ1ysMlIdUXYx5sdPC-SkLko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_07,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=753
 mlxscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_071221_314321_8F4D82EF 
X-CRM114-Status: GOOD (  10.64  )
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

On 2/27/2024 6:22 PM, Baochen Qiang wrote:
> MHI devices may not be destroyed during suspend/hibernation, so need
> to unprepare/prepare MHI channels throughout the transition, this is
> done by adding suspend/resume callbacks.
> 
> The suspend callback is called in the late suspend stage, this means
> MHI channels are still alive at suspend stage, and that makes it
> possible for an MHI controller driver to communicate with others over
> those channels at suspend stage. While the resume callback is called
> in the early resume stage, for a similar reason.
> 
> Also note that we won't do unprepare/prepare when MHI device is in
> suspend state because it's pointless if MHI is only meant to go through
> a suspend/resume transition, instead of a complete power cycle.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>


