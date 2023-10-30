Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A070C4332F
	for <ath11k@archiver.kernel.org>; Mon, 30 Oct 2023 14:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZhgm3zfE8uAytXQjS3tq7gUAKPWhITQy/8J/3/VaXg=; b=xro+SUkVi2Rfrm
	wstZiKPJgahQ/KZfh6LmnTUrTpaojKlvGRdAM5FH5sXuhzGzdBQ90xbxPq/kat6IWcXOdiGaYJA6u
	tOL9McdECJ4rztzM4v+2lT3MiVxxOqkVFt1jw0tvBG6uRCNLCR664e4Au3mCHrymUsOClz6FIpttT
	1QcTimuyNb68xrDjyu7HAt8XYR3WfoRtHpjVx2hTRUUdWllJnwIaqNh3FCoNBtHeDvCOC6nu1Ouye
	iIn3Jstd5VHOGvlwM5fb3o/GIHCMZ5YufrjMIfAPUh4OzYBReRKatjoifPbuRQ8/dX2TyriuJhW1R
	tIhT5R3Zi1mGkNv2SGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxTVW-003VQs-36;
	Mon, 30 Oct 2023 14:44:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxTVT-003VQW-1m
	for ath11k@lists.infradead.org;
	Mon, 30 Oct 2023 14:44:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39UE4MqY010666;
	Mon, 30 Oct 2023 14:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mXSGZUEjOreMAiQEx2UggsToksCZ04QF2O4pPO5u4gg=;
 b=Z0gzTpYd9PbtuUsxDjs4VynhJcIPJ4v2uP8P57PV8S9HObq+w5QM5UNKRIV8yDHfWgNY
 VqT7ziHS03vJE10M3enptjSEhyd2ypf97cEIbe9M1CCGrremhf2xi0Tfa+kPdd4XFC7y
 jc5eKR1tdn0HsspNoOwXMtrDequOQQMLXngT6A6/We66taG7wNHg0VzwjmMjis2F1Jdd
 skfU8T3947d4I2roFbrC5v3r8odkGbKzPe/rDAAa6g29OSP7qKtZYU6+f3YCB1HV9liW
 Sq83BFIkEAo2XKqNvY1G/LnwklilRxodGQ5YqJwhDb5RXIsFOrleuawRwQOuRQ8OBq0g vw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u280jrwfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 14:44:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UEiZxc028289
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 14:44:35 GMT
Received: from [10.48.245.206] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 07:44:35 -0700
Message-ID: <13eb9eec-29f7-431e-9069-c2dd67d50db5@quicinc.com>
Date: Mon, 30 Oct 2023 07:44:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] wifi: ath11k: Remove unneeded semicolon
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Abaci Robot <abaci@linux.alibaba.com>,
        Anilkumar Kolli <quic_akolli@quicinc.com>
References: <20231030060225.28987-1-yang.lee@linux.alibaba.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231030060225.28987-1-yang.lee@linux.alibaba.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: slg_UMqCEmqJW65rj-7bdCV3966MkiR3
X-Proofpoint-ORIG-GUID: slg_UMqCEmqJW65rj-7bdCV3966MkiR3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_10,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=444
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310300113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_074443_595717_0468995E 
X-CRM114-Status: UNSURE (   8.03  )
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

On 10/29/2023 11:02 PM, Yang Li wrote:
> ./drivers/net/wireless/ath/ath11k/fw.c:136:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7073
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
