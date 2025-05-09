Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3691C3ABBC
	for <ath11k@archiver.kernel.org>; Fri,  9 May 2025 17:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLAgz81NgOrdhBcH1vnfPBEBFEqANxBTAuyVS9y0I9k=; b=MK6ro2QiVYmK5G1eff7X8TY6B5
	1AGJiOEfsfaOsTdgpXq67/N+cjpjgTCkOOOtHepd+AVUg5qOIZEG+IlUldXobX9cfg3M/D5g8aeJu
	kEMQJSRJQteKTfgwAuPOozb0Wm5StHI/mK9sQ08O76PC7DeYsUxS5wzHmgbV3N9WWhg71eiOPTjbm
	Y4kLaLvHHKz7xSub4R+j1UlgXJPnsbTtDkhzAtU623848Id3RlvFR0P02STI/Lf8YyzAdiK7CktH6
	NPSVwMLlhw49yppZmHo4VkS5RClDP4OQ6JY7ps4QxvkcPbwtwwqs2Fb1dWc6sPXuFYT/U+bBfF1X+
	4gk6r8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRfc-00000004SVt-02FT;
	Fri, 09 May 2025 17:38:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPkU-000000046W9-2ND9
	for ath11k@lists.infradead.org;
	Fri, 09 May 2025 15:34:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5497mmnx019353;
	Fri, 9 May 2025 15:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hLAgz81NgOrdhBcH1vnfPBEBFEqANxBTAuyVS9y0I9k=; b=TiXupP/Ujv5tqw55
	DNYljiCk9RZ2fdQzFdUYavXhs0HaJdBGIXpkHkgRnW9e/6Uv5/Zo4VuPPmvmaokU
	nBF7xyfuVlww8XN1VErwvaX2UrVPiVWFt3XJG4I1gWZ32xcfnkhUX3FyltzZ/SZp
	nb0e4eVhHa2amKNegxwzNJ0LGWHUft7HT9HkD8QSY5rYJ7YS0KTe4E9+xBQNl5Kv
	0++2JBm8G3b3skQ8AUHHY3KdBYor6z8s9Pvke2FOiB0deeQhT1J+2l6qB6xkzv+8
	ulsTBMVAoFo7PamSRQQ75uTrK+SCV3N2aF1JEIHV8FezPi/BtxKI6FGOIuz7CMrh
	PCTW1Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj4jma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 15:34:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 549FYjxb011981
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 15:34:45 GMT
Received: from [10.216.9.250] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 08:34:42 -0700
Message-ID: <45f60f9b-66ff-6bc1-f77d-c29f255a2fee@quicinc.com>
Date: Fri, 9 May 2025 21:04:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] wifi: ath11k: support DBS and DFS compatibility
Content-Language: en-US
To: "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>, <kvalo@kernel.org>
CC: <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, Mihai Moldovan <ionic@ionic.de>
References: <20241127022742.4016870-1-quic_yuzha@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20241127022742.4016870-1-quic_yuzha@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681e2096 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=bC-a23v3AAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=AOP5zEUh8TzVeoG01q4A:9 a=QEXdDO2ut3YA:10
 a=-FEs8UIgK8oA:10 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE1MyBTYWx0ZWRfX0I79IZYkpF96
 qxbTLkOVmMp9A4LNS8lfXbYzBjIBvLQ8ORzvOxWAFcZp9yzxg/BLlfUx0fFnHTv57YGOyCZ1a1M
 +MDKbZ28EzNm7xaFFPPa3aRSOzPevL55EunpQtOekDV9Z6h+BLd8g1+Ihmr7ZF+Lofmh3WC3nEX
 UVorP0vkLdwstaCvYTKi83R4xSJJaniHP71uIvLu9l+UtB2R6YlV9LSEaz8hl7C7w3HK9KnBVll
 Yh5eu6tAcesLjKM09C+PbRfy1a1FT4eOoKO1BNRdvCO1eKpcYlvymVeEi83NLV58l8UBm6xZIG7
 FS6BB2MpqG7m/ga6E8U4nSgcLWhbg/57MP3Pp5vwEAspf5oWMNaCuI/ezHVw3Mrrw8LDWGauy1y
 OYfFjjwhgjYHocmR46NO9mynQSy2vGwK01x9C9JV13zb7hB1MnxmAYBQ1qqf/zpJTGUm3nN8
X-Proofpoint-GUID: 7jPHvQtOneHefREtHzIq9j9pKHp7ynNt
X-Proofpoint-ORIG-GUID: 7jPHvQtOneHefREtHzIq9j9pKHp7ynNt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1011 lowpriorityscore=0
 mlxlogscore=616 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_083454_628884_2F29A202 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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



On 11/27/2024 7:57 AM, Yu Zhang(Yuriy) wrote:
> Now some chips which support 'support_dual_stations' will enable DBS,
> but will disable DFS. Restructure the ath11k_mac_setup_iface_combinations
> function to support DBS and DFS compatibility.
> 
> About 'support_dual_station' feature can refer:
> https://msgid.link/20230714023801.2621802-2-quic_cjhuang@quicinc.com
> 
> Add a ieee80211_iface_combination to support DBS and DFS compatibility,
> one combination can support DFS(same with non dual sta), another
> combination can support DBS. When running different scenarios that will
> use different ieee80211_iface_combination due to mac80211 will go through
> all of possible interface combinations.
> 
> In addition, maximum number of interfaces of these types should be total
> allowed in this group.
> 
> The chips affected are:
> 
>   QCA6390 hw2.0
>   WCN6855 hw2.0
>   WCN6855 hw2.1
> 
> Other chips are not affected.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-00410-QCAHKSWPL_SILICONZ-2
> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.1.0.1-01161-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04402-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1.
> Tested-by: Mihai Moldovan <ionic@ionic.de>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Yu Zhang(Yuriy) <quic_yuzha@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

