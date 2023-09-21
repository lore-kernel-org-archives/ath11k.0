Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2F5E7D0A2
	for <ath11k@archiver.kernel.org>; Thu, 21 Sep 2023 20:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aFU92IKu03LsAqaBMVxTzu6jJxA7wftiVjnVebMSkCc=; b=W6vCzHtTt1dVWU
	3vUdnvpghHFqOVXfuME4w9rqrr5lM8M+xLV6lZVvTfBKfsQG0rQZGcwyskQTKZ4H0TG2y+Xw0iknE
	58hWUFKR84d8ThKvyshBJ1GWRJClSxxJBAJ2KDJUYkImWFc3wzF1Jw43E0YZBnvI2mTrSIhP5xjK6
	HHkz3lV38dS+V3pKifAt7muc0jlKX3nEwxGYbH8x2VzDmvnFRX1fh6JitGmjhORfBRlaEp8c2J17b
	wYiKgUYSoRZYJkywYx+azUr4xwnri+y5rP2Mgj+NHlSmIxHodteFFxMOiHBxZNk4Q3fXpSthzluSQ
	/E7BSN9YHQ0wg0ehb0Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjPqo-0071oB-2S;
	Thu, 21 Sep 2023 20:00:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjPqm-0071nT-0x
	for ath11k@lists.infradead.org;
	Thu, 21 Sep 2023 20:00:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38LJlo34016326;
	Thu, 21 Sep 2023 20:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tBOEr4nA3Ih94k8mdYHrasFkDL/5zM6Q9uGMr7GTt8A=;
 b=Ml4OFhHp6KSSebbLpwaqXDCyjSgh/++sQznOcan/b803ApyIx+K5lv2bGqHd972CHdno
 fWLSP4XZhIqPND/AabVDTAXy3qaa2+VeueO0RxvKlOIOOnJILxOnStGCyJon06LPfUn1
 niMPcVJCDDo9AOpVN6ddDlyjXUMf0ZuhC36ddI4ncynB0alL7q0oen5xjdpKUA0xjW85
 dldGHSxNq9M9CHEtCD5jj4hus9KtoNNJ20VyuookMX8BElJOb2h5J5gWJppyGyEdoOrw
 0vgyIIik2rIkDhxoB7He3Uh5CYPxsxwertyNigUSYAxWHRR9jcD4QUW7U7j/3QYIJBHU tw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8uknr3ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:00:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38LK0Wv1007630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:00:32 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 21 Sep
 2023 13:00:31 -0700
Message-ID: <a06adf34-555c-4558-9645-65011d86abe9@quicinc.com>
Date: Thu, 21 Sep 2023 13:00:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/13] wifi: ath11k: save power spectral density(psd)
 of regulatory rule
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-7-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230920082349.29111-7-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8FKSsJS6ZWcaX9Lsbp6Dd4DdrmZVGWfp
X-Proofpoint-ORIG-GUID: 8FKSsJS6ZWcaX9Lsbp6Dd4DdrmZVGWfp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_17,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=833 priorityscore=1501 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309210172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_130036_340735_58AE4522 
X-CRM114-Status: UNSURE (   8.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 9/20/2023 1:23 AM, Wen Gong wrote:
> Save the power spectral density(psd) report from firmware to struct
> ieee80211_reg_rule.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
