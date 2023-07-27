Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B80C0015E
	for <ath11k@archiver.kernel.org>; Thu, 27 Jul 2023 12:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3dObJqfJjIaaw6EBkj2ukUiCGCJDgU3gb0a/cn1PhIE=; b=EwyucIv9DMUBTy
	Wy0V2DMZ6mu5MPpbm1ye3DpG9uZAw/UNHq4xWZfIKyRtp6PbPX8Xg1POGrF/cIHFxg+PQPjK7etnB
	RN9nCKq8f6z2vYFjeZ8yAjzOYOMr+FUUYUdOk9Gi1G+XTkIqq2gdvnQJ/sj+qeg+XN86rpWu4VB6K
	LLSyx2cCQrLMArYqR+Is9Jv/5aUKn+WSo/YIQ4XpaAT/9mWMzT6MasumtJMJGv19MKL+gH+plU9+j
	A9cN3CVsbwYubeWEstNcUctLktQjSntQ3qmYx+EJN9uGN3iDRM2mx//oxSbTX7XrxwLT0SEI7Zf/N
	hoDxkRexfPSTM2TJkm1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOzfi-00DdZ7-07;
	Thu, 27 Jul 2023 12:00:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOzfd-00DdRm-2J
	for ath11k@lists.infradead.org;
	Thu, 27 Jul 2023 12:00:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R80CXN013108;
	Thu, 27 Jul 2023 12:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yzBNCFjs3BQDgEnY0hEgRVorqFsbUoUsDcjCM3bB7DU=;
 b=lfX222ddN2S+MK3kwv5tbY07UMeQil6IzXvQwMytzQk0g4TfbsYDyaLRV/yXE3EywrQj
 5Wi9XSnfD6L4RyOYbfXLgFsGHL4SxEgpMH2+5k1aX/wDW5ClCsCl3lvue9edJehGe8J+
 in+8gMQmzJhAqqbbnYs4Q8hyGcH6ZF4JhEb6eX2opsRmYgFpleJAbCvHUgH4U47MA1mY
 sDarN5KODqwFCv4MjzY4dVivwghdbDGeu7P4QbT6cCxYBtmu1ZMr+V9gIZcWWRmdTJBT
 mzpFUik01Judj3SIJ8EjNInfbXE7G1H9T9Jq24jnUyjk3sQJKEl0bDy80F9e2i0SS8tU Pg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s32jn2r06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 12:00:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36RC0YD3018949
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 12:00:34 GMT
Received: from [10.201.207.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 27 Jul
 2023 05:00:33 -0700
Message-ID: <db8afcb0-2297-7748-daeb-625eeb0b1c6c@quicinc.com>
Date: Thu, 27 Jul 2023 17:30:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] wifi: ath11k: fix band selection for ppdu received in
 channel 177 of 5 GHz
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230726044624.20507-1-quic_adisi@quicinc.com>
 <8fe1a927-14da-445c-4c48-e3f4b4c324d4@quicinc.com>
 <87bkfx287p.fsf@kernel.org>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <87bkfx287p.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gr7Nte_IOz_JsSSWUMzBd_4D0cY1oJ35
X-Proofpoint-ORIG-GUID: gr7Nte_IOz_JsSSWUMzBd_4D0cY1oJ35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_06,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 mlxlogscore=834 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_050041_787880_EA51479C 
X-CRM114-Status: GOOD (  11.14  )
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

On 7/27/2023 11:42, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> 
>> On 7/25/2023 9:46 PM, Aditya Kumar Singh wrote:
>>> 5 GHz band channel 177 support was added with the commit
>>> "wifi: ath11k: add channel 177 into 5 GHz channel list". However,
>>
>> I'd use the same syntax here as in the Fixes tag:
>> e5e94d10c856 ("wifi: ath11k: add channel 177 into 5 GHz channel list")
>>
>>> during processing for the received ppdu in ath11k_dp_rx_h_ppdu(), channel
>>> number is checked only till 173. This leads to driver code checking for
>>> channel and then fetching the band from it which is extra effort since
>>> firmware has already given the channel number in the meta deta.
>>
>> nit: s/meta deta/metadata/
> 
> I can fix these in the pending branch.
Thanks Kalle.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
