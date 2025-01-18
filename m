Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C748C02185
	for <ath11k@archiver.kernel.org>; Sat, 18 Jan 2025 10:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mke5AJzDyr2LS0CcFgm6BfOCAPPezOVDYVQFwn1RjOs=; b=gXIx9l9JGnFsxajfhcfMa/7WGo
	LhMoHpm5+MOltDs6kdxwlRFQ/TfwmbABU7YeVHgryfVFRo8nbYtbyIS7GeBxfa/Olrr+leMoAfkRx
	79q3p3cMmAfO7pZanwKYHRycYUCD5cE5CVy0XLEeO3AfKbYBlKDBC9AvA3y4PMuwHRyDMM7fpn0Fq
	Qd8ZE9d9Q9tcs48IGTtepyhS9TQ8uB9dBLraI79F1iGNmJ0F/qO2SJedoIX5jb7ypOcWF9P7wlKVK
	LqYoWtr/sci4ABSOJso5H1VMAYqzl2mqevlx4xZZy5q/pTqaxNvI5kjGmhaa1/LZ/NAZARJqh+OF7
	dSwDnLjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ667-00000002C6E-1b7p;
	Sat, 18 Jan 2025 10:30:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ659-00000002C1X-0m0h
	for ath11k@lists.infradead.org;
	Sat, 18 Jan 2025 10:29:36 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50I33GVc016772;
	Sat, 18 Jan 2025 10:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mke5AJzDyr2LS0CcFgm6BfOCAPPezOVDYVQFwn1RjOs=; b=GOVzrLw5OeBwEM9r
	c7SBkpcNIKs4XXvcjPvRiIimvKtYW4QtwwoeprVFQAvLvlPIXxNnPHQ/+QqlqPbW
	PktG12ZhsQqRR3l/8O7Rq9AxVTD51quT9cC964nRnJtk3dMjmuqx1sPQErPvhFVF
	d0baZCd/eXp0XGHZP75AZqWjNnQomsc6IUMYl/+xKmyY6miy9NNgf31CfiKXYcPz
	w4lJCT+sl0oW2sYkj43aQhCuLHYRVnMoAJmBQclgugLgJ5MSw9t9RB0ejAgMLm/c
	/fE8CFXK5l52GlNySDWdNCcpT/JYdrSlxpkiTp3SCcvkDafPeTcY+q9YGgBxIZvM
	OkZcmQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4483a60jhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Jan 2025 10:29:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50IATViN024452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Jan 2025 10:29:31 GMT
Received: from [10.216.41.16] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 18 Jan
 2025 02:29:28 -0800
Message-ID: <20e0a239-3d23-473b-5bc8-41bc25a64088@quicinc.com>
Date: Sat, 18 Jan 2025 15:59:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] Revert "ath11k: clear the keys properly via DISABLE_KEY"
To: Nicolas Escande <nico.escande@gmail.com>, <ath11k@lists.infradead.org>,
        Sven Eckelmann <se@simonwunderlich.de>
CC: <linux-wireless@vger.kernel.org>, Steffen Moser <lists@steffen-moser.de>
References: <20250117191455.3395145-1-nico.escande@gmail.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250117191455.3395145-1-nico.escande@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jC-Ar-GjEnRJO1decWX4a_QZDseqzk8i
X-Proofpoint-ORIG-GUID: jC-Ar-GjEnRJO1decWX4a_QZDseqzk8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_03,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=531 malwarescore=0 phishscore=0
 impostorscore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501180083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_022935_362637_E17B37D6 
X-CRM114-Status: GOOD (  10.21  )
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

Hi Nicolas,

On 1/18/2025 12:44 AM, Nicolas Escande wrote:
> This reverts commit 436a4e88659842a7cf634d7cc088c8f2cc94ebf5.
> 
> This as been reported by multiple people [0] that with this commit,
> broadcast packets were not being delivered after GTK exchange.
> Qualcomm seems to have a similar patch [1] confirming the issue.
> 

This will re-open https://www.spinics.net/lists/hostap/msg08921.html
reported by Sven. The recommended ath firmware ABI during GTK re-keying
is SET_KEY instead of current DEL_KEY followed by SET_KEY. We are looking
at other options like some marking by mac80211 for the driver to be able
to identify if the received DEL_KEY is for re-keying. Also I'm curious
if roaming between secure and non-secure mode is a critical use case.
If not, we can probably go ahead with this revert as temporary WAR,
@Sven?

Vasanth

