Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2978CD3A66C
	for <ath11k@archiver.kernel.org>; Tue, 29 Oct 2024 15:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3MdcoipdIRnK9+Ca03jplOSa94F+Bw1qnqwKNtfxiM=; b=vXo8BR2QZGOnMFwTsthPLm/TRY
	CW9o/yPWSpotj54izFDRyaAu1N5L/ypS7k+DXqLf/Htn+gOC8iBXiTVETZXqbxZhGYfR/eb4KhNtE
	SPwWPBtnPmLS5VPBcHG9vmHMkZy15ppSUIaz6UFWwq8cTOPBxTLb9DRZVD/8RiWIAynTLcidhWVaU
	u4BUoNnNQP/C0ek+P3mH9YgOtlJJNYTYoZg38pZw/sliPIzOZa3C9zTGcGbDnaJYcqwzK6UL1XvS9
	HWa/4Fu93PSZbBruimb5UORTC+tXOCNt8D0zsrLw3xxtqFR4Ui/KXEYfaBNc+iaiJcuWw2v9ePn5f
	UHbUq8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5o0A-0000000EsRv-0XDo;
	Tue, 29 Oct 2024 15:19:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nvV-0000000ErTQ-1vxk
	for ath11k@lists.infradead.org;
	Tue, 29 Oct 2024 15:14:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T9plcu011999;
	Tue, 29 Oct 2024 15:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N3MdcoipdIRnK9+Ca03jplOSa94F+Bw1qnqwKNtfxiM=; b=eMQXxVDu55ankXke
	lfh8wmcOKo8G7oOVfFggMoM+DkGLkfVT7kwiZGkrKhTke7Ik+wYhFQUZrsEYli9L
	kLLnRf8Y88ab7QWdoxu8xmNlt/E6D4dR92KuDVIpnK66L0e2vO1aCwNvxBj+RI62
	/akxpInsWre8VlmDCQ3gWQBqsatIpM0vSTE9g9DmX8FRZhZifbLrMUOYFe++J0pX
	6qOJu6tkqooa/4N0G2Po5wz/UXph/IBT50EvABeyBeJznNYVM5DO9W3530oRjl/i
	94nuaio8x7qqkJfmpyRi+pfLbEd42TwgLO4JO46f+oIJogtY37foJm4OEy74rV9v
	wDAZbA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gr0x8teg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 15:14:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TFEU0S017634
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 15:14:30 GMT
Received: from [10.48.242.156] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 08:14:29 -0700
Message-ID: <2373b563-5866-40f1-8ce6-cc8e59df1adb@quicinc.com>
Date: Tue, 29 Oct 2024 08:14:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Suspend hardware before firmware mode off
 for WCN6750
To: Balaji Pothunoori <quic_bpothuno@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241029083340.3010798-1-quic_bpothuno@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241029083340.3010798-1-quic_bpothuno@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: k7N0lI4B_AABewCTCeJVrhos3_YJ7LpK
X-Proofpoint-GUID: k7N0lI4B_AABewCTCeJVrhos3_YJ7LpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=851 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_081433_729055_312B89E1 
X-CRM114-Status: GOOD (  10.81  )
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

On 10/29/2024 1:33 AM, Balaji Pothunoori wrote:
> During rmmod, the ath11k host driver sends a QMI MODE OFF command
> to firmware.
> As part of this command, firmware initiates WLAN de-initialization
> and accesses certain UMAC registers during this process.
> Currently, on WCN6750 WLAN hardware, the system is in a sleep state when
> firmware receives the QMI MODE OFF command.
> This results in a firmware/hardware reset while accessing the UMAC hardware
> registers during sleep state.
> 
> To avoid this, add logic to send WCN6750 hardware specific
> WMI_PDEV_SUSPEND_AND_DISABLE_INTR command to firmware prior to sending
> the QMI MODE OFF command.
> This will cause firmware to cease all activities and put the device in
> a powered-on state that prevents access to registers which have been
> powered off.
> 
> Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


