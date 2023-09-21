Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BA2E7D0A2
	for <ath11k@archiver.kernel.org>; Thu, 21 Sep 2023 20:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJKxRgINXQsBBr7tZV8KSufuiGzdAanI32ZKDoulspY=; b=ZaJvQvZxYQaxTA
	r6VztXLeC7zH8i0WLADSZE8JlDkYjxltxGdXKZcAMGilMZCsXKQsZRb2p4w9MDcSxHhd2dZpJhtWG
	4W8ivNVkv7EZiJ6gojCoTfB+DVbYfHy+jgfcYPG4+b5VzviSI9syf8YfqkdMaLjYzLHyBdRpTFRk2
	kzp0wVZbxrUfhh3n+A2VWuENrDS/JPE3XtR2FKS0VlqnR+DCx+s16+X9PlU+CBdXfK440iSxeeK+c
	EcGYOLruncUX+uDenq2fAjlb0/b6X3+wZLat9+DMHPncaSkPA8M4MfBBilGj5xWnABTBCU6XjEGLE
	CMFjXnJYBGazJHvWJnrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjPza-0073FM-1n;
	Thu, 21 Sep 2023 20:09:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjPzW-0073E6-1y
	for ath11k@lists.infradead.org;
	Thu, 21 Sep 2023 20:09:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38LIGO4N026981;
	Thu, 21 Sep 2023 20:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=O7x1ku8yq3Q7XcRndWPZcracLq1QL/uzpcoWge2dw1I=;
 b=ohp3Zexlj5xJ8vNC/Cw6bqryxIbgo+35DH7etxm6Pr/TdLw/aQHnA1ujsCBoDdq2Ntyi
 n7y4HugF2QnVLARn1BTG53k6Gzxk16/v2fy4FIP+70PtDzCNi4V1zg41VeR2fJGYDM9s
 GbkoylKBQP4h/4RP6DZ8stX195uHRNgNMS67LqK4Chqm7F68QPw7ULqyuL138cHEd3b6
 +qWQArkkJLV/yeLXownyhV76eqon6GjTdOzGRtUF7SgNnqagLVbf92UTbF+H8o9fhjfz
 /dttv9DBrRWBgiFQ9HtA9RpuDnQ5dE0v9Ha8ugJ204TlvuZtVHGy2hhIQQxNEm5GO7AW AQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8txpg7d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:09:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38LK9YQh030220
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:09:34 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 21 Sep
 2023 13:09:33 -0700
Message-ID: <6a179226-371c-4ee2-97d0-8b590ccec14d@quicinc.com>
Date: Thu, 21 Sep 2023 13:09:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/13] wifi: ath11k: fill parameters for vdev set tpc
 power WMI command
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-10-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230920082349.29111-10-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5phwTgr04i7rrl6cvq9y8pEDPOT5xHQT
X-Proofpoint-GUID: 5phwTgr04i7rrl6cvq9y8pEDPOT5xHQT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_17,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=737 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309210173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_130938_789956_CB6620EE 
X-CRM114-Status: UNSURE (   9.30  )
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
> Prepare the parameters which is needed for WMI command WMI_VDEV_SET_TPC_POWER_CMDID.

Kalle, can you s/is/are/ when you pull into pending?

> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

(but I have a non-blocking comments I'll post separately)


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
