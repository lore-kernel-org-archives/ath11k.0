Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B8BCD1288
	for <ath11k@archiver.kernel.org>; Tue,  2 Apr 2024 00:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mr3w8UUQCnaWAZITSzBbYW4tqwiLvQ9kI7XBzZe+a4Q=; b=sVAWjZWQ3B9oRmmVschMBaAfch
	cWT8UGcwTZxfOUOpFCskOI5hV51VP7aUa+QJ/xFWc8Xa68Wbh7DK8vSjdhzimArhEHTsABUmUCNrz
	1qJvdCfAPHWhBO9W9jBuN7T8h/5sdL8STXW4x8g0TSPzo/+LaYKusLenZ9a0WbapzdRCc9WmIJosl
	zXhs2lyZZxytFNBdoEBltQ6Zz9zXksGNxGB6dTPz7RMJG9R6Y3HGSyUKxaQsYwyGb+GbniG7CKqOx
	kODfcpO8c1LOVWg5TueGQARF8cBvAaa5vJdgSSUyndZa0wuwbJmlzsH7Evs2fiHjufJU52aMhdMqS
	ZIdQq4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrS8A-00000009Gjy-0zlM;
	Tue, 02 Apr 2024 00:36:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrS86-00000009GjG-1ekA
	for ath11k@lists.infradead.org;
	Tue, 02 Apr 2024 00:35:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4320QKfH007185;
	Tue, 2 Apr 2024 00:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=mr3w8UUQCnaWAZITSzBbYW4tqwiLvQ9kI7XBzZe+a4Q=; b=fZ
	0koqICovXA5zmyxEHL7QriTEvNEGq/EPVV6mxf328d1i/xncb77RBkxoCFRRz7SN
	X3kL+YdiED5lVRkeakGRwd7/psd8/dQguJeUyI5juXYfb8svECVd0vWI3W8IR5CP
	fyFHg624gYN7JZ8GmS5+N6nkx2o8jVgYA0DVATYdO2+kcr64mrkqUUUf/kqz2KYc
	5TWzntzlEPkwtdsLXYOZ+zZKYr1t1MRmKczl/gpcvit63FK3RiphyBGEmB77bRCW
	mg1yxtg7noEerj5Lm8jNR/k/32zZjC2n7NjQ+ZQ2tGrosXPHQ/zub1kbFk/BlTE5
	q5kdnPppWBVY8S7dJV2A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x7ucfhmvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 00:35:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4320Zqf4024115
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Apr 2024 00:35:52 GMT
Received: from [10.253.8.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 1 Apr
 2024 17:35:50 -0700
Message-ID: <7cd963ba-e4b0-4714-a814-983434589059@quicinc.com>
Date: Tue, 2 Apr 2024 08:35:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wcn6855 2.1 - slow download speed on any pairwise cipher except
 CCMP
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
        Yaroslav Isakov
	<yaroslav.isakov@gmail.com>,
        <ath11k@lists.infradead.org>
References: <CADS+iDX5=JtJr0apAtAQ02WWBxgOFEv8G063vuGYwDTC8AVZaw@mail.gmail.com>
 <19778bfe-19ad-4ee4-8f3b-80e7b124571f@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <19778bfe-19ad-4ee4-8f3b-80e7b124571f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Xv_GgXm_kuKutmojdIryGr19YcstoDcj
X-Proofpoint-ORIG-GUID: Xv_GgXm_kuKutmojdIryGr19YcstoDcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_17,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404020002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_173558_487101_037CF663 
X-CRM114-Status: GOOD (  17.11  )
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



On 4/1/2024 10:53 PM, Jeff Johnson wrote:
> On 3/31/2024 8:49 AM, Yaroslav Isakov wrote:
>> Hello! When I tried to switch my OpenWRT router from default CCMP
>> pairwise cipher to any other, supported by both my router (Asus
>> TUF-AX6000) and my laptop (Thinkpat T14 Gen 4 AMD with WCN6855 2.1), I
>> saw that download dropped from 1Gbit/s to 100 MBit/s. When I changed
>> back to CCMP, download speed recovered back to 1Gbit/s. Upload speed
>> is good, though, for all ciphers - 1Gbit/s.
>>
>> Initially, I thought, that issue with either router hardware, or
>> openwrt driver - but, I tested the same settings on another laptop -
>> T14 Gen3 Intel - and with Intel WIFI, both download and upload speed
>> was 1Gbit/s on any pairwise cipher.
>>
>> This issue is 100% reproducible for me, it happens all the times I'm
>> switching to any pairwise cipher other than CCMP.
>>
>> I'm on Linux 6.7.6, compiled from sources on Gentoo.
I'm not familiar with Gentoo, is there any private changes in it 
compared to upstream ath11k? If there indeed is, could you try Kalle's 
ath11k tree?

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/

>>
>> Here is my dmesg for ath11k:
>> [   13.092519] ath11k_pci 0000:02:00.0: BAR 0: assigned [mem
>> 0x78600000-0x787fffff 64bit]
>> [   13.093400] ath11k_pci 0000:02:00.0: enabling device (0000 -> 0002)
>> [   13.095723] ath11k_pci 0000:02:00.0: MSI vectors: 32
>> [   13.096260] ath11k_pci 0000:02:00.0: wcn6855 hw2.1
>> [   13.974707] ath11k_pci 0000:02:00.0: chip_id 0x12 chip_family 0xb
>> board_id 0xff soc_id 0x400c1211
>> [   13.974732] ath11k_pci 0000:02:00.0: fw_version 0x1106196e
>> fw_build_timestamp 2024-01-12 11:30 fw_build_id
>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
>> [   14.315774] ath11k_pci 0000:02:00.0: Failed to set the requested
>> Country regulatory setting
>> [   14.316046] ath11k_pci 0000:02:00.0: Failed to set the requested
>> Country regulatory setting
>> [  337.889222] ath11k_pci 0000:02:00.0: failed to enqueue rx buf: -28
>>
> 
> There was another reporting of that error in this thread:
> https://lore.kernel.org/all/5c63a3a2-29fe-444c-96f1-f87c89d7af39@gmail.com/
> 
I don't think this is the same issue as reported by James there although 
same error message. For now I don't know the root cause to that message 
but it's unlikely it causes some tput issue.

Let's wait for Yasoslav verifying it on latest ath.git.

> +Baochen Qiang for awareness
> 
> /jeff

