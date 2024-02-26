Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8965BC48BF6
	for <ath11k@archiver.kernel.org>; Mon, 26 Feb 2024 20:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWfb8LAmzPA8Gnu95x8SRgEuA/tcVAfFA4/Igl16jCQ=; b=CJvQZ80Htr9i+ssBsVGeBvKW1q
	bCmDLnUKKCSw15DT807co8aNj7OzMVEVIN9Dm8yxkSjEmjUgz+i6HhqUZ289S7RIp7VJARaEL879Y
	/0Fy0KPJ6I3ZgA7SQvXYO7RNQjaTFQim66VQCID/zO44s5bOBYBc70QOZeeR7CGevomp4A6Lw6Gwx
	sDS6BhmZZ8Rgzf4DOHXLYrSZYsUPxdH4/ebunO6+vl5McE32LyiKxEqQXIopresvD7NQL7gvHxTn/
	hIoz2ho4xUvJiOM6uicKYs2umNnREM1IhbmxPN8DnI6v1rqtJUZ9/nbqP8xXeFgV7P+kX7IJASo8k
	eCW5J91Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rehnT-00000002Ylt-3sze;
	Mon, 26 Feb 2024 20:42:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rehnR-00000002YlS-15pO
	for ath11k@lists.infradead.org;
	Mon, 26 Feb 2024 20:41:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41QF8und011711;
	Mon, 26 Feb 2024 20:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=gWfb8LAmzPA8Gnu95x8SRgEuA/tcVAfFA4/Igl16jCQ=; b=lQ
	qIy2oHtOZTOjwjYW0muCkMv59TylXAmV6fuqOHUMsQvJRvPWG2dFxEdpk2K2Q3pS
	Wh7/s1rH+sVnttVWZOfct4lDvBoiJzHzUHxEcbJ9kn0EMGF4JQRxCGYQwiv+qplr
	5woI7cLP7+Cny4Sc7j8Uf8QM6Mw1mBWHsvI+053N5BQ20KNgJk0ailSEONQpZdnS
	MpASdeP+fFI1OknGRf+f1G3DiWhsQQQN4/7RPLessnvJFtP/rcEat7F5amDKyMrW
	x4FmLWP/rhikkIXDEPi2ff9qClW27k4kfeHiGatDmC8P5DrYDJjVmqzfb1DC+6PO
	6dtA33T91WCyZAG7KVGA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxq21cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 20:41:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41QKftxL002200
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 20:41:55 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 12:41:54 -0800
Message-ID: <199ef285-2a3f-45d9-a3a2-e5d48110c121@quicinc.com>
Date: Mon, 26 Feb 2024 12:41:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] wifi: ath11k: advertise P2P dev support for
 QCA6390/WCN6855/QCA2066
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240226060203.2040444-1-quic_kangyang@quicinc.com>
 <20240226060203.2040444-7-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240226060203.2040444-7-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: p3LbKUdZfPGOQGEZwmqD3UqostMn9WBl
X-Proofpoint-GUID: p3LbKUdZfPGOQGEZwmqD3UqostMn9WBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=651 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_124157_451687_56F74D7D 
X-CRM114-Status: UNSURE (   6.24  )
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

On 2/25/2024 10:02 PM, Kang Yang wrote:
> Now that all the necessary pieces are implemented we can enable P2P
> support for QCA6390/WCN6855/QCA2066.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.2
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


