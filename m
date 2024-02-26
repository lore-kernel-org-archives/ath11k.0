Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C11C48BF6
	for <ath11k@archiver.kernel.org>; Mon, 26 Feb 2024 18:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYDckl6CHcQHSj0iKCVuzDHRH7dEPUgLnUMSA1NXEqw=; b=oeQgeLOZ20U+NREk1tqancyIK7
	iyhzVR+CLwngyJa/1sh4E94PGRF+vvzUiz9KMctBISXxizVlFxT2G92qJnF8HWtDEtUDmO6DopZFa
	aAxxBntSgBQQlv3J1RgPdbUF4AlFGI4azmgZJY3Z0kBz/WhAk6Z1lTdlGTkFcXXj2gkT2xEBvukE+
	3iekElEza2anTzJea1yODWlM+DgUewqC3LLyNwsrQr98uWbIgi/r2BBzAxfpL9aUU6k4ObAbsvoix
	eQGPow5T+lYDErF1Nf5OFVGJ0n/jGk8ofBrwAGykNLjNmKq0ym1hZH/IGq/tMh8g9S52UIiA1nCwo
	1vuGdsaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reg6M-00000002FYg-1ybB;
	Mon, 26 Feb 2024 18:53:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reg6J-00000002FXZ-32rc
	for ath11k@lists.infradead.org;
	Mon, 26 Feb 2024 18:53:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41QF8G1c002103;
	Mon, 26 Feb 2024 18:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=PYDckl6CHcQHSj0iKCVuzDHRH7dEPUgLnUMSA1NXEqw=; b=Wz
	dP0eHwLkCLZXyUAHHITguNhmkogRvF2EW2aYPtl/RHfplzl3GdbnKEANncujL96z
	fq2dwmWFITJoqiOweuJrzG5+HVf6JMnvHUlskRSw8rfg/b+dXZZUfbzpRQ+tyE1N
	ysFnljUMqi6j/A1sBhDXYZLx2+AF34IJ1T0ecHK0LcbCyfuyRRGEzHfksSKlopXD
	N5CL+csmhqAdhSNWxdy4T9xZYb57bPM3ecEoqu4U+1ehuQ818EPGHqjQgwe2lUbb
	Ns0FndPZvfNZuTVO57LazXY5XEipUgof0qxDJ2a44ifOpUhFMXiKbwVIs8CAo0vS
	qBkQKEIA4u8H1l03niBw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxksu7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 18:53:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41QIrIUv028820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 18:53:18 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 10:53:18 -0800
Message-ID: <290eddc6-494c-4e34-98a7-3a40c86bd33a@quicinc.com>
Date: Mon, 26 Feb 2024 10:53:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] wifi: ath11k: change interface combination for P2P
 mode
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240226060203.2040444-1-quic_kangyang@quicinc.com>
 <20240226060203.2040444-2-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240226060203.2040444-2-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DzxLtB6IbORadadY4vYyrllgjCy4M4jA
X-Proofpoint-GUID: DzxLtB6IbORadadY4vYyrllgjCy4M4jA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=868 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402260143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_105319_806172_B02DF1F1 
X-CRM114-Status: UNSURE (   6.71  )
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

On 2/25/2024 10:01 PM, Kang Yang wrote:
> Current interafce combination doesn't support P2P mode.

s/interafce/interface/

Kalle can fix this in the pending branch

> 
> So change it for P2P mode.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.2
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


