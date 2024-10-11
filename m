Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC2AD24463
	for <ath11k@archiver.kernel.org>; Fri, 11 Oct 2024 02:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+updjsBw4m+RSE17kOknAf4fPZ4jAdTCy2FSnqjk5lU=; b=rGQcreiQNQKBR0mpDOMsHeYWv0
	9uK21jfaxP4ylNswjxVk51aL81PtQPHn1a7JeKaCbPlkwr5sKSz9ZWjoSFEGxiOl5py2oA9hKLKDE
	F5JSzDMGiquup8Dg/b3lyfa8QupEIGPWcpVaL3ueDWd9nq20BMBcalpVS67g5+XAxyyL5uEr+ipqu
	df+AZgKjLbLijxEXi0Fp9UOOSULrdNwcnl5na8JfuzaEuhGxAM8GwnY7BSDQaa2UmLgZiLfW1K8D2
	+uSSQrI/TRQpiKiLQnlAg/bei3kUKvQ7NhIm2Iae7/qtpCUOVh025mArBjnWET/Su4f5AOirnN4Fi
	0PnQLEDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz5qV-0000000F6aU-1kAz;
	Fri, 11 Oct 2024 02:57:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz5qS-0000000F6Yz-20Y2
	for ath11k@lists.infradead.org;
	Fri, 11 Oct 2024 02:57:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B1Hf0K005437;
	Fri, 11 Oct 2024 02:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+updjsBw4m+RSE17kOknAf4fPZ4jAdTCy2FSnqjk5lU=; b=H1Ua1Ae09jvgnZid
	5ZeRl5fkXPs9MYKr/h6ZG+6d/eFP60l6CDUFw9hSefRJxZfp2jxX301d6y0/lep5
	Lwl0dxiH8gRgqVIQ9bVRUw9eNgMvtG6KYSnv4JOClEctQbkoZZadzE+JJuxPmEWI
	VAH1TBB2sWCHJSBjKeXe8uxSFmG1sP3w3Lo/AAzpfReYax9TcXqKvNc5SIrWA+N/
	zNMVfWBQOwy5xypgK5aCyAHNpTLkIPT52KDENwB/UFsv85NGUpzd9nI7Od9PgWqo
	bamrHBsBhtEggTBZlfSjMdi218nQ0wjKPe3AW4egQ0bma+YhThpPEqd1z+qwlHbT
	UfCttg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426t7sr602-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 02:57:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B2vTj6006525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 02:57:29 GMT
Received: from [10.253.78.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Oct
 2024 19:57:25 -0700
Message-ID: <c6c5068d-ed05-4b49-97e1-f4962839cf44@quicinc.com>
Date: Fri, 11 Oct 2024 10:57:22 +0800
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
 <cc8358b1-2442-4a40-8eb3-0912423db554@quicinc.com>
 <3giotvkrwailt75gndhup7xhqvlc3vdowdoypi5vaeebuojp45@vkqxbtjsbksf>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <3giotvkrwailt75gndhup7xhqvlc3vdowdoypi5vaeebuojp45@vkqxbtjsbksf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3ny5XeZeQSbTwTeYGSh1bxG09vMA8IPf
X-Proofpoint-ORIG-GUID: 3ny5XeZeQSbTwTeYGSh1bxG09vMA8IPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_195736_574828_B89B0C3F 
X-CRM114-Status: GOOD (  17.22  )
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



On 10/10/2024 10:40 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 10, 2024 at 09:59:11PM GMT, Miaoqing Pan wrote:
>>
>>
>> On 10/10/2024 9:47 PM, Dmitry Baryshkov wrote:
>>> On Thu, Oct 10, 2024 at 09:29:02PM GMT, Miaoqing Pan wrote:
>>>> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
>>>> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
>>>>
>>>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>>>> ---
>>>> v2:
>>>>     - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
>>>>     - relocate pcieport0 node in alphabetical order.
>>>> v3:
>>>>     - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
>>>> v4:
>>>>     - update 'ath11k-calibration-variant' to "Ride".
>>>
>>> What exactly is Ride? Is there just one Ride board? I thought it's a
>>> board family name.
>>
>> I just follow the existing boards, 'Ride' is a board name. Both 'Ride' and
>> 'Ride r3' boards are attached with WCN6855 WLAN chip.
>>
>> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts:1112:
>> qcom,ath11k-calibration-variant = "Fairphone_5";
>> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts:958:
>> qcom,ath11k-calibration-variant = "SHIFTphone_8";
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts:879:	
>> qcom,ath11k-calibration-variant = "LE_X13S";
> 
> There definitely are other Ride boards. I see patches related to
> qcs8300-ride. Does that board use the same BDF file?  If not,
> Qualcomm_SA8775P_Ride or QC_SA8775P_Ride sounds like a better approach.
> 

QCS8300 and SA8775P both use the same WiFi card, so the same BDF file 
will be used. The extra variant will increase the size of board-2.bin.

Anyway, the calibration variant is no other side effects.

>>>
>>> Also, could you please extend the commit message with messages from the
>>> ath11k driver, showing the chip_id / board_id ?
>>
>> The board-id is non 0xff, do you still think we need to add
>> 'qcom,ath11k-calibration-variant', following is the WLAN chip board data
>> info,
>>
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=519.bin
> 
> I'd ask Kalle / Jeff to answer this question. Are we sure that this
> board-id won't be reused by any else device?
> 


