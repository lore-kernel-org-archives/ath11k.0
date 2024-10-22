Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987E3D1CDD3
	for <ath11k@archiver.kernel.org>; Tue, 22 Oct 2024 10:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+s6AQopGnxwcBNHC7PWJg7SZl5oszgpZ1Oj13OA6Es=; b=GndQKPurr38cmhkFRcDcBATrRU
	UaBNFIz2IPo6XqL0JJrgJf0zuLU9+IvAd1EiWPt9YacBMIhy1q1X3hQcP+RlRiFCfzu33pC4PAU5w
	GYdYdCs/8UzAJ7vK7yiuNZBPmgM/PtjfXwvOd9eUeXmbnN5FYDXATZKbT4WvDGF/nzg+gkla1hSA/
	pDISUUKD1Djn9L1gw+T/GLxYxaTCdEV0YSDvxWNuPXSF49e6GsxHCOkpqwfSlNPD/7zzjH91R/gBR
	xEmJxIzNyhhjnUpYHkxfFoLPbHl1AutRVBrOTZbSxvZ4IZLAyan0krnEZY/gwACdVoITA5PcC+D4Q
	UzHp6q0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3C3m-0000000AW4B-0ko7;
	Tue, 22 Oct 2024 10:24:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3C0b-0000000AVeS-2N9p
	for ath11k@lists.infradead.org;
	Tue, 22 Oct 2024 10:21:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M8rwPu029542;
	Tue, 22 Oct 2024 10:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N+s6AQopGnxwcBNHC7PWJg7SZl5oszgpZ1Oj13OA6Es=; b=nXcnw76OAD9D9zCC
	lZmabVRP2PFvS4nXp3K+TRdePhwI1PZbfGbsqU0nLMIKMo4MLfaO/4RaTcHY7lhY
	XYuVOocnS1c9oWMz0BH75+HNr8AYyp6XMvVpD6NawuR3uuqtcC6JtbLFciquw0Uh
	u5Gnnju8ApTKBevv4CWChXTmUsPHvK89VuqluG/xALP1456VYxZSaPYaCWYHugpC
	DK6qcQNrHOoPdTXwQMv6EcpLGxMH+2vKmAPuNMa98maUEif2xDE18+ioAJx9VBF+
	DdzkPH/olh7IHPcgJexjNuoIn/GQs5cM6ZLWh3b3iCp23RFzE/G+ClFITPdHmyo/
	U6KFJA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vc7y3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 10:20:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MAKtVM014405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 10:20:55 GMT
Received: from [10.253.13.77] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 03:20:53 -0700
Message-ID: <1c5f5c93-db06-4490-af2e-bbce2d184c94@quicinc.com>
Date: Tue, 22 Oct 2024 18:20:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath11k: add firmware-name device tree property
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <kvalo@kernel.org>, <quic_jjohnson@quicinc.com>,
        <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241001033053.2084360-1-quic_miaoqing@quicinc.com>
 <20241001033053.2084360-3-quic_miaoqing@quicinc.com>
 <smgbishqbin4kcpshqvue3ivvfko2l6rj2w4ikwydosbkq6kde@pdbzhklj7znm>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <smgbishqbin4kcpshqvue3ivvfko2l6rj2w4ikwydosbkq6kde@pdbzhklj7znm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ookBtTEFOklfLVemqbibubzxo3qtZxKi
X-Proofpoint-ORIG-GUID: ookBtTEFOklfLVemqbibubzxo3qtZxKi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 mlxlogscore=860 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_032101_657803_EAC37B47 
X-CRM114-Status: GOOD (  20.38  )
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



On 10/22/2024 5:57 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 01, 2024 at 11:30:52AM +0800, Miaoqing Pan wrote:
>> QCA6698AQ uses different firmware/bdf/regdb with existing WCN6855
>> firmware, which is customized for IoE platforms. And the 'pci-device-id +
>> soc-hw-version + soc-hw-sub-version' may not be enough to identify the
>> correct firmware directory path.
> 
> Why is it so? What makes it so different from the existing platforms
> that you can not use WCN6855 firmware?

Just as I said, a new customized firmware for IoE devices.

> 
>>
>> The device tree allows "firmware-name" to define the firmware path,
>>      wifi@c000000 {
> 
> You are describing platform node, while the commit message talks about
> the PCIe devices. Could you please clarify, whether it is a PCIe device
> or an AHB device?

PCIe device. The change is for sa8775p/qcs8300 those non-AHB boards.

> 
>>          firmware-name = "QCA6698AQ";
> 
> Could we please follow the approach that has been defined in the commit
> 5abf259772df ("wifi: ath10k: support board-specific firmware
> overrides")? In other words, instead of creating another directory under
> ath11k, create a subdir under the WCN6855/hwN.M/ which contains your
> device-specific data.

Sure, thanks, will update.

> 
>>          status = "okay";
>>      };
>>
>> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04402-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
>>
>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> 
> P.S. please CC linux-arm-msm for future respins of this series or for
> all other submissions that concern board-specific DT data on MSM
> platforms.

ok.

> 
>> ---
>>   drivers/net/wireless/ath/ath11k/core.c | 12 ++++++++++++
>>   drivers/net/wireless/ath/ath11k/core.h | 11 +++--------
>>   2 files changed, 15 insertions(+), 8 deletions(-)
>>
> 


