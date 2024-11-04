Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EE9CFB422
	for <ath11k@archiver.kernel.org>; Mon,  4 Nov 2024 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzW5P3qb3Z1GMZlfDiqZUQ5ix7xIJXt7+iLEPXs/j+U=; b=Sf2zP7eKCpAi2hxIYp6fL3BATu
	z1a9YQJA/QFQEaN9zAiPF0dfUHJKQmiFyPwjmj8hoZy75UuWAhbIPwineFm1MLuNicTe3WlwBFE+w
	mZuEtvxANjwRg1qZ8oSuughANSAxd9wXT/C7TRQCQOZqAdIVOCuhHKfK9hjNn0L9ERKv0yp0NLCZx
	Ojhci5+gL5kw6YwQnbhOIzPOeXwlZtvAeN9tT1iKW75cilsLlfh9/EDKvXTi7jgma4AtDcwcEi9rO
	lWVIfA03UkQoy8H6chNnH6xCEwo2PkvBjaIIN4vTh+9OgFlIVtS/XRIze7uKRYWx1W/0ke10skIBm
	ODXPuSpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zFi-0000000EFSN-2bc9;
	Mon, 04 Nov 2024 15:44:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zEQ-0000000EF8I-1vLv
	for ath11k@lists.infradead.org;
	Mon, 04 Nov 2024 15:43:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BVZRM029772;
	Mon, 4 Nov 2024 15:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KzW5P3qb3Z1GMZlfDiqZUQ5ix7xIJXt7+iLEPXs/j+U=; b=FBbbYCJ5C04flBaA
	IZr43wx6eCK6Nl207tS+rirCQpOyXZ7q2wpps2YLE4qTpZ7mYiOqoFlz7thw1Xjs
	yMgbxaaTo8XOsnrvHWlY+s9tbgMMAyM6nml22+AsO4b8deiWbqElzjRMCny35nQY
	Bym1tvmQ5cvsIeUq7DKgQQXHa1KaXtS4oW68t4UjUH67syaz8fxAmezywyuIUPBw
	hdMGt5NbwHLEPa7J3YB6UsHlFwRxKFVlaLzU6V0x7BHrzLcnKk0rxrjhJ01Pihbv
	1pf79Pc4ZFpCc61eFGFG/v1BQOGgNTjDcrss447emwgMzWpc5Wkn42NHBWYIyC8M
	DeLxmQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd2r4p0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 15:43:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A4Fh33x011720
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 15:43:03 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 4 Nov 2024
 07:43:03 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath11k@lists.infradead.org>,
        Balaji Pothunoori
	<quic_bpothuno@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241029083340.3010798-1-quic_bpothuno@quicinc.com>
References: <20241029083340.3010798-1-quic_bpothuno@quicinc.com>
Subject: Re: [PATCH] wifi: ath11k: Suspend hardware before firmware mode
 off for WCN6750
Message-ID: <173073498333.2435998.1800878061133992125.b4-ty@quicinc.com>
Date: Mon, 4 Nov 2024 07:43:03 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: U8mZ8uLNTwDe0flfUc7gqx5xDRI39yWc
X-Proofpoint-GUID: U8mZ8uLNTwDe0flfUc7gqx5xDRI39yWc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=727 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_074306_554831_DB573E74 
X-CRM114-Status: UNSURE (   9.18  )
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


On Tue, 29 Oct 2024 14:03:40 +0530, Balaji Pothunoori wrote:
> During rmmod, the ath11k host driver sends a QMI MODE OFF command
> to firmware.
> As part of this command, firmware initiates WLAN de-initialization
> and accesses certain UMAC registers during this process.
> Currently, on WCN6750 WLAN hardware, the system is in a sleep state when
> firmware receives the QMI MODE OFF command.
> This results in a firmware/hardware reset while accessing the UMAC hardware
> registers during sleep state.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Suspend hardware before firmware mode off for WCN6750
      commit: b39f8deb8df9664f34aebd9c6c8e234a7417041b

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


