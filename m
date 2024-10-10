Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1A8CF11F8
	for <ath11k@archiver.kernel.org>; Thu, 10 Oct 2024 13:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGCbsWz8gy5tgRPuE2BxLsuuYVUl/Jo8Eu25qDm/xJc=; b=mMZKC0TVlmi+AA46FgfUP05I3X
	fv8Ny+xeZVzmvj9RS8P87E9NLwtmzYKX7A3SoZGfINyYefXfTBWVjkCEcgrwP3jpAnWJv12dQROm+
	W4AUV5JOMXRgQ78RTex9qU5Lws1T6AsuxGHmxw0+6up9PdEf5rcwdVCVBofbu3n451VoJmhyT3Lnb
	7Lm+bju6mKiPV/xssXOBtNtXSANMj+ngaK0AO6C6/AmKCQYWG8LLoQ3kZKMTYcPBbkSp3tuWt0AVO
	wYmJ1tZjUSCVxFl1wumRkFGmlpSnVv7d4uDLH0n8Q567Uq9qXpJYw9j2mGxi1yEyOOJHwPVcq4QlR
	kcTPiXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sythP-0000000D0r6-1eXk;
	Thu, 10 Oct 2024 13:59:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sythM-0000000D0qT-1xUx
	for ath11k@lists.infradead.org;
	Thu, 10 Oct 2024 13:59:25 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AD97w5027261;
	Thu, 10 Oct 2024 13:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RGCbsWz8gy5tgRPuE2BxLsuuYVUl/Jo8Eu25qDm/xJc=; b=B1QPmk0XDQiTgZ8z
	5GYTXpB4H9UZ4Nbuvz/pVw98DICT5BtOb024T65OLLirC4FoIIj9AZUtg3nuKg+a
	v8nBnAjAicHUj+2eV6u3KH/1Hp6SVwP4WqDQ1Sv9+axOfD7D+tKE2A+iV7zZqExD
	QK0fhRkTE7OaFTMnpe8QfzLL1qFnVk/7nWDYeqv+rc0wqV7+d4EhVCzUiAZrNLwh
	KMUmn4V/x2dWc46cgYYI/SYntNI84BioVIkt3uPhFQhP25tL4FuXz4kdD7ckca2M
	saWAPJGWJhIPZyQbXpTHDb7WKRK/q7uF5MbcADCNdfhFq0stxZwQ+UpFonUyNKWW
	zdyfoQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426fj6r3y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 13:59:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ADxH3b011696
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 13:59:17 GMT
Received: from [10.253.78.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Oct
 2024 06:59:14 -0700
Message-ID: <cc8358b1-2442-4a40-8eb3-0912423db554@quicinc.com>
Date: Thu, 10 Oct 2024 21:59:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <linux-kernel@vger.kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <quic_vgarodia@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>
References: <20241010132902.2882939-1-quic_miaoqing@quicinc.com>
 <asvhh4kzq6s6yz3wrqfmuolcnlonoobogoh45pnq4zdr44lpxs@zgarzpduk2sk>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <asvhh4kzq6s6yz3wrqfmuolcnlonoobogoh45pnq4zdr44lpxs@zgarzpduk2sk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WBP-2xQxWo_SKbY-ADLvmGaXaqApDdrQ
X-Proofpoint-ORIG-GUID: WBP-2xQxWo_SKbY-ADLvmGaXaqApDdrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410100093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_065924_631871_717B7DDA 
X-CRM114-Status: GOOD (  14.91  )
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



On 10/10/2024 9:47 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 10, 2024 at 09:29:02PM GMT, Miaoqing Pan wrote:
>> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
>> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
>>
>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>> ---
>> v2:
>>    - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
>>    - relocate pcieport0 node in alphabetical order.
>> v3:
>>    - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
>> v4:
>>    - update 'ath11k-calibration-variant' to "Ride".
> 
> What exactly is Ride? Is there just one Ride board? I thought it's a
> board family name.

I just follow the existing boards, 'Ride' is a board name. Both 'Ride' 
and 'Ride r3' boards are attached with WCN6855 WLAN chip.

arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts:1112: 
qcom,ath11k-calibration-variant = "Fairphone_5";
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts:958: 
qcom,ath11k-calibration-variant = "SHIFTphone_8";
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts:879:	 
qcom,ath11k-calibration-variant = "LE_X13S";

> 
> Also, could you please extend the commit message with messages from the
> ath11k driver, showing the chip_id / board_id ?

The board-id is non 0xff, do you still think we need to add 
'qcom,ath11k-calibration-variant', following is the WLAN chip board data 
info,

bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=519.bin




