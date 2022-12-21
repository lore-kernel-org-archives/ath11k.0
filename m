Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F65C10F1B
	for <ath11k@archiver.kernel.org>; Wed, 21 Dec 2022 23:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HR6go4Wzvvt8jI2F+WtGIeIkiSWL2PzUIHq+kPqU+XY=; b=kUQQdeH0uXd11V
	2cF4++px2B+pQerpcISbz/mB+SzogtSn273Ztr6020afIqWbxEC/brv9+CwY7EizoJGmaCv3IfjRj
	NCI4DJxkNgZ/jernm9g7m7syVZ8SPb0SsftwKFoq42V+plR4f3d7oDmxdiZURkMHg5B8gB1y5McE5
	UVXS0ArGNZMptKSnbmIdXoKL1o7FE6SUpIt60z/7hDkhNLT/rKVEhi0kHnbR6GLse6o0Wh8NQnZxL
	9yDhdz/dXaHakquKJ5PIbejwNTWvwLm/2wO2koI+Vgam9v/vRDMxjpFpIXVKCDGscSjCBULz61UL4
	hW2u2u4sfZxqmOA+GB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p88HH-003Twy-PX; Wed, 21 Dec 2022 23:13:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p88HF-003Tsn-7c
	for ath11k@lists.infradead.org; Wed, 21 Dec 2022 23:13:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BLKfwdR011146;
	Wed, 21 Dec 2022 23:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5HWHQDdfUcBP5u5eXO+mfGukcew6CaRvbRxf7h2qfr8=;
 b=oUL4+OzrhYnZKAuLoUj/1caHKfjXQNfB95YRJ/VNvOlwidqRGDj//V7O4bsqeylkxWRs
 Lrpqa/uOlT5N5BNVGmk8mAapYBaudZF5L0vHMwNwKlX+FDDk+UolCJCzLr0UgadBTJn1
 unhDAqSAJ3nn49Wxp5Z9VjWGnP6j7G/Owoxyk2A+qMSAgQe4mt6sZhQLfr3Ji3Ag5clv
 r0eHux4CcefpfP7+Tub/vfPjBJC0GvT9BswhC5727P2XPz8KQ0BGjFmQOUiO02F+XR8C
 y+2mzJSGMJ69+wDKgQYwI6hhPi3TItDZjMhiQ41vDoE3dZPgOXWY3Xyi8INX64iGKJ/U ow== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm2brs7xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 23:13:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLNDP3b014055
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 23:13:25 GMT
Received: from [10.110.106.113] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 21 Dec
 2022 15:13:25 -0800
Message-ID: <38ababd2-0ec9-f1eb-2af8-e7c4368817cd@quicinc.com>
Date: Wed, 21 Dec 2022 15:13:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/3] wifi: ath11k: add support to parse new WMI event
 for 6 GHz
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Lavanya
 Suresh" <quic_lavaks@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>
References: <20221214164639.31542-3-quic_adisi@quicinc.com>
 <167162704604.23347.8011938867680129068.kvalo@kernel.org>
 <c73a9b25-f7b7-5265-7a86-8b599aaa6df9@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <c73a9b25-f7b7-5265-7a86-8b599aaa6df9@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DDYo2VbWBHWSMOlGCxJGDhgbPHYmO04N
X-Proofpoint-GUID: DDYo2VbWBHWSMOlGCxJGDhgbPHYmO04N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_12,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=972 adultscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_151333_445156_7E3C475E 
X-CRM114-Status: GOOD (  12.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 12/21/2022 4:54 AM, Aditya Kumar Singh wrote:
> On 12/21/2022 18:20, Kalle Valo wrote:
>> Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:
>>
>>> In order to support different power levels of 6 GHz AP and client,
>>> new WMI event for regulatory - WMI_REG_CHAN_LIST_CC_EXT_EVENTID is
>>> added in firmware. This event provides new parameters required for
>>> 6 GHz regulatory rules.
>>>
>>> Add support for parsing 2.4 GHz, 5 GHz and 6 GHz reg rules and other
>>> parameters from WMI_REG_CHAN_LIST_CC_EXT_EVENTID.
>>>
>>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> I don't think using Reported-by is correct here. You are
>> adding a new feature, not fixing a bug reported the bot.
> Bot did report a bug in v1 Kalle. That I fixed in v2.

but it did not find a bug in merged code.
in cases like this I've added the Reported-by in the signature section 
of the patch so that the bot sees it but the tag does not become part of 
the commit text


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
