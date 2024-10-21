Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91C3D15DA2
	for <ath11k@archiver.kernel.org>; Mon, 21 Oct 2024 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHeHBrYwxMWQ5dqpnebe7U8TJnrsgqXzhfBrqoLnTMY=; b=4lil2fIBw4FSp/Jeb0J2LLJWX2
	UEjWn5jcZji1vjzRQvsOv6jDAnqInfh6SMe4yM337h72U201zCVP5wgUxVfwhCMIyUNCmUhPfnXzc
	iQlxSIAR9iFsnqhiQefbbnE+IeyvlBiLBKeiDwDNcbLILQ7nAk2fuRqVg4i9gIFq2DmTcEdm2wgJq
	S06+R4IcYIgfP6DAa45ZHnQ+c9KSsMFQYkjtLgPR8jdZtjrSz+5kufxqe810d6x65ZFwMMbSdQHd6
	crw0a6c+3NMf2HDEz0T9KMq4MK0gT55BdVgYAwRazN2hNYefVnFiHTaI2yzS8YM6rB6VeaoXlqP7h
	Sjd2cYEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tYx-00000007dx3-1kg3;
	Mon, 21 Oct 2024 14:39:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tI2-00000007bMQ-1KTm
	for ath11k@lists.infradead.org;
	Mon, 21 Oct 2024 14:21:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L8Vwwx014493;
	Mon, 21 Oct 2024 14:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zHeHBrYwxMWQ5dqpnebe7U8TJnrsgqXzhfBrqoLnTMY=; b=cRjiCiTO5Sk7Ze8p
	UztD0//clkrsvGweiNy5AN6kcgn6jBDAAfi2svWbb/uq94GE+RlRsdzuDcRjj8RP
	V2+kX8611e42NsVOnPZgnXBMvsB1IZxQjP2LXAOAhnDIMvo3e8cldk4zaxrA9cdi
	PNiY0+OvhMP/qa6uSTOCXysOyaXGsr5NgazHTJMQ8878v5TpBM0t0MQHj/SQ/y1K
	poYpzAfc1o8kfWK0cUuG4z8PHaYhx0a1fvzgrW+0SxdLYkBDFmMqwFz8obL6HmDt
	KE6Akru0qr8oDOSZGIcUkAE8tcRcWhypC3BtX2FzOZa2JGjAoHA5ezRWmyJuE77+
	ZNBegA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dkhd16uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 14:21:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LELe03023458
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 14:21:40 GMT
Received: from [10.48.241.209] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 07:21:40 -0700
Message-ID: <bba049d4-39f2-491b-a5e5-ebae0a77fe45@quicinc.com>
Date: Mon, 21 Oct 2024 07:21:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k-firmware: QCA6390 hw2.0: Add bdf for Xiaomi Pad 5 Pro
To: Jianhua Lu <lujianhua000@gmail.com>, <ath11k@lists.infradead.org>,
        linux-wireless <linux-wireless@vger.kernel.org>
References: <ZwR1hu-B0bGe4zG7@localhost.localdomain>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <ZwR1hu-B0bGe4zG7@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yM7wa7HumAMYZAzzt_AckFEeLOEDug0z
X-Proofpoint-GUID: yM7wa7HumAMYZAzzt_AckFEeLOEDug0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=794
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410210103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_072146_593324_54594B9A 
X-CRM114-Status: GOOD (  13.15  )
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

On 10/7/2024 4:57 PM, Jianhua Lu wrote:
> Add bdf for Xiaomi Pad 5 Pro, which running mainline kernel.
> 
> * description for what hardware this is:
> 
>   - it is a SM8250 based board
>   - it use QCA6390 as wlan module
> 
> * origin of the board file (did you create it yourself or where you
>   downloaded)
> 
>   - taken from stock firmware image
> 
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> 
>   - QCA6390 hw2.0
> 
>     + bus=pci,qmi-chip-id=0,qmi-board-id=255,variant=Xiaomi_Pad_5Pro
>       sha256sum:
> 	  a5c99867d398b4e8773d106100e8575e1b3c29b8e18921dae50029b1253eac06
> 
> * attach the actual board file (board.bin)
> 
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

This has been staged:

https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/commit/4c8ae2fb2b78d5b0bebed63fe8b0f348f9fbc33e

BTW in the future be sure to include linux-wireless with any ath1*k board
requests so that they can be tracked in patchwork.

/jeff

