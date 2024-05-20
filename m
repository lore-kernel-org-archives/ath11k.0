Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599BEC25B7A
	for <ath11k@archiver.kernel.org>; Mon, 20 May 2024 22:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RG24D0jMSArkJ8aKcIz8aY1W+LtHL4YLsFY1SjgX/Mg=; b=PVvmcEKfUlnbyO9yyTHb+77NDG
	+gfsdLRMmad9lXdZa6ZwU6bobhoc9iG6hPir1CEsLCBaa+ngTc/1rbVSszZifVHZ86Kh7O/h4bIrc
	Q66RjLeI9xsaYxxGh/nw9A6ZOHHfR2o2t14O4SdO/O6YEThEPQSKdRs6FssJs/1URIuG8ZmXfd5CM
	UTIbl+SG3M/m5QSlnLLWnN+WAzj4CgOVDJEZ6TUjUOopBUT4vMxdyN8A0J+a+xItL/6tWVXmyOnfQ
	XpFuNbB8VeUdFGqSRLpVBe2t8DVmhPrDXOpdzUb5mfjs+ZGNozKlOZAPOmt5U7JgmG1NJK/ALMp90
	eY6pNFbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9BEM-0000000Fe1j-46wY;
	Mon, 20 May 2024 22:11:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9BEK-0000000Fe0x-0Lxg
	for ath11k@lists.infradead.org;
	Mon, 20 May 2024 22:11:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KCePuR024457;
	Mon, 20 May 2024 22:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=RG24D0jMSArkJ8aKcIz8aY1W+LtHL4YLsFY1SjgX/Mg=; b=Rz
	K8LiaGRhel0jJRPbRUu64RfOkY0J/drOL+aEmE8cIhlxGlsbRIkd9Of1XsLrgVra
	3NhZYFw3AHEk0tVfOzhjdsYuVT3EFbJbRVvogMfyBR7csuS6ANt2XFgiBKR0CxhO
	c9KFdrFCwk5KmF6iMQZn8NLck763O4C+lXfB3F2+0wWr0GZuSmF2Yre9Y7soRlaq
	fOxUJ98LDhUAKzU4NLdhC9ahCeMptlCwXQ4upDQ4gPmrhPf9UpD4oYjmNCkwoj9P
	4YvkX/42WhbkzwLqo4oHtieLA5AGa4M+kYQ8joVbOubW0pOc1f66gc56eO5Dcg5v
	TrIzpNuucNrTDwiEflzw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6psncaeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 22:11:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44KMBcPJ025047
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 22:11:38 GMT
Received: from [10.110.17.44] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 15:11:37 -0700
Message-ID: <e9283a0d-1ea5-4abb-a0cd-110890612415@quicinc.com>
Date: Mon, 20 May 2024 15:11:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath11k: restore country code during resume
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240520024148.5472-1-quic_bqiang@quicinc.com>
 <20240520024148.5472-3-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240520024148.5472-3-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p85PPjyVbaavzQoJjSk9N558EQxij3U2
X-Proofpoint-ORIG-GUID: p85PPjyVbaavzQoJjSk9N558EQxij3U2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_11,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 suspectscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_151140_158815_1FD280B5 
X-CRM114-Status: GOOD (  10.61  )
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

On 5/19/2024 7:41 PM, Baochen Qiang wrote:
> We got report that regdomain is not correct after
> return from hibernation:
> 
> Before hibernation:
> % iw reg get
> [...]
> phy#0 (self-managed)
> country CH: DFS-ETSI
>         (2402 - 2482 @ 40), (N/A, 20), (N/A)
>         (5170 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
>         (5250 - 5330 @ 80), (N/A, 23), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
>         (5490 - 5590 @ 80), (N/A, 30), (0 ms), DFS, AUTO-BW
>         (5590 - 5650 @ 40), (N/A, 30), (600000 ms), DFS, AUTO-BW
>         (5650 - 5730 @ 80), (N/A, 30), (0 ms), DFS, AUTO-BW
>         (5735 - 5875 @ 80), (N/A, 14), (N/A), AUTO-BW
> 
> After hibernation:
> % iw reg get
> [...]
> phy#0 (self-managed)
> country na: DFS-UNSET
>         (2402 - 2472 @ 40), (N/A, 20), (N/A)
>         (2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
>         (5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>         (5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>         (5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>         (5945 - 7125 @ 160), (N/A, 30), (N/A), AUTO-BW, PASSIVE-SCAN
> 
> The reason is, during resume, firmware is reinitialized but host does
> not send current country code to firmware. So default reg rules with
> country code set to 'na' is uploaded to host, as shown above.
> 
> Fix it by restoring country code to firmware during resume.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Fixes: 166a490f59ac ("wifi: ath11k: support hibernation")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


