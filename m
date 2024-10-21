Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D96CD15DA5
	for <ath11k@archiver.kernel.org>; Mon, 21 Oct 2024 14:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLpQ6qjyi/TBr/tyOKj/ngg9W8JrmIpwmjcHBe9zq8c=; b=BKly3vQ96LwNnbjJqPbPKO7pOa
	QfhmDlWqObzyOosvPxvd06kovRVaebZTUOtJTlHeLz1i6MoY5HXaSgm2a0YRDFI69o47JNI3dcxGn
	CdlSro8hkupaLCVU8zG2hKWMOnwpN0aWmhQaspU2bAwooDzVQgaiI2aGh3SCl5rG+7iB/RnjlMNsC
	pBnsBsH9uuydAmAE9l8i4X0RzIzHgRJ6/AdoZXa6m4g4DPpA0AYmMUDP8oJBpYqR5vmGAWg0Ie0Al
	MQT95QzxmR3lC6PqLmIylsj+7wNxZAM31xPMQAn28OZm7Hlt1RBZWoGmky7jVOqlyL5XM/V/bMtnY
	AgK24sYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2ton-00000007h35-3oA7;
	Mon, 21 Oct 2024 14:55:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tKF-00000007bf1-1zme
	for ath11k@lists.infradead.org;
	Mon, 21 Oct 2024 14:24:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LA80r6029714;
	Mon, 21 Oct 2024 14:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jLpQ6qjyi/TBr/tyOKj/ngg9W8JrmIpwmjcHBe9zq8c=; b=jxH9UHgVl//hUtY4
	uS3Ji6dUHKUAKo/+G2GCgL80GcOR0CPYr+pFsnG2KiuFvJDly+GXWBFHZ6C46iHu
	sV58a4N6hFkwEitBlW5MMfwPABThBChLFDNbjTyqzoZFXmRKcPCbH5ONdq29wR1G
	xtChuOAFhOeQnYx2KjHNmik23avvM1I03zwUf3vEL/1TjlYq7AbektuAZn0pYmu2
	PCLPt6+HWjB/oKnQ1oOHwD3BKqk/wnoy8u8JugkTp1yuoj0vflZh+Xf40zVp4NIG
	c4hanbBemxc9yIB02oxz9p7oOzn6nxZ1w1c5bJsnVfDhGqZLqWBxPwaBWbZu1cQn
	OyesMg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vuw1ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 14:24:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LEO0uc024954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 14:24:00 GMT
Received: from [10.48.241.209] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 07:24:00 -0700
Message-ID: <dc92b42f-a71d-4ca9-bde2-92c3ed30718a@quicinc.com>
Date: Mon, 21 Oct 2024 07:23:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k-firmware: QCA6390 hw2.0: Add bdf for Xiaomi Pad 5 Pro
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Jianhua Lu <lujianhua000@gmail.com>, <ath11k@lists.infradead.org>,
        linux-wireless <linux-wireless@vger.kernel.org>
References: <ZwR1hu-B0bGe4zG7@localhost.localdomain>
 <bba049d4-39f2-491b-a5e5-ebae0a77fe45@quicinc.com>
Content-Language: en-US
In-Reply-To: <bba049d4-39f2-491b-a5e5-ebae0a77fe45@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tonQVbf-0XB0t-E0HiY9rae1vdcpTaWs
X-Proofpoint-GUID: tonQVbf-0XB0t-E0HiY9rae1vdcpTaWs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=834 bulkscore=0 spamscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_072403_673159_CC165198 
X-CRM114-Status: GOOD (  13.30  )
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

On 10/21/2024 7:21 AM, Jeff Johnson wrote:
> On 10/7/2024 4:57 PM, Jianhua Lu wrote:
>> Add bdf for Xiaomi Pad 5 Pro, which running mainline kernel.
>>
>> * description for what hardware this is:
>>
>>   - it is a SM8250 based board
>>   - it use QCA6390 as wlan module
>>
>> * origin of the board file (did you create it yourself or where you
>>   downloaded)
>>
>>   - taken from stock firmware image
>>
>> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>>
>>   - QCA6390 hw2.0
>>
>>     + bus=pci,qmi-chip-id=0,qmi-board-id=255,variant=Xiaomi_Pad_5Pro
>>       sha256sum:
>> 	  a5c99867d398b4e8773d106100e8575e1b3c29b8e18921dae50029b1253eac06
>>
>> * attach the actual board file (board.bin)
>>
>>   - The name of the files are equal to the id string in the board-2.bin
>>     (minus the ".bin")
> 
> This has been staged:
> 
> https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/commit/4c8ae2fb2b78d5b0bebed63fe8b0f348f9fbc33e

sigh, correct link:
https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/4c8ae2fb2b78d5b0bebed63fe8b0f348f9fbc33e


