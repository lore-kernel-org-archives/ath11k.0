Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5ACC5478C
	for <ath11k@archiver.kernel.org>; Mon,  4 Mar 2024 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/d3O2flMmIfwl8AcHFH2F11T5Q0WP2/Z4oV+r+V5GkE=; b=H6FHoEpF4WXnsE1IDxbcOqkxkt
	T5A3ze8MCAqvkc14qBJE0ZPQW8zcVYxhzyqT78w6bg5k3Nfzgo0PpiZTIgE/+INxU3tdu96ffa1MG
	KJOBBf6xNP6/Aj2M9LFEDOLaD9c46ogF2oCeWZRGdmfbWe7YbHDbbNY8jgbC2wh9cqON05DpltArY
	SlFENABOj0n++kfoxmELkxOlfRKtehD1zT07HhIU73+G4fvB5PkMuaZSkthbGCFnk1+KXO/qhyzA0
	bC/VXmsZN1v/VZCeCFJ8wAgC73nV+PYE+89N8YWfqZLzRPDPyStc27aqFMqmpMPPmVfzIKiZrwghv
	kJFe9SXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhAWZ-00000009g97-3vXl;
	Mon, 04 Mar 2024 15:46:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhAWW-00000009g88-2pN9
	for ath11k@lists.infradead.org;
	Mon, 04 Mar 2024 15:46:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 424DLlq8008602;
	Mon, 4 Mar 2024 15:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=/d3O2flMmIfwl8AcHFH2F11T5Q0WP2/Z4oV+r+V5GkE=; b=Le
	1nvCTFU9L9ZULmC3QVtDBJbUkhuR0o+/qnPGJK8A+R0Sf1G1tLUTqDI8TftjJnp2
	81T+JDQQuwuE5paTRl1Gqz8SJ0N1PEcxTGw1uMRlgqoOWh/cKGOoETq/pV0vz6iF
	0g+K4E1BT/SJE77XQxApYpB66odk7xxQ/E9YIxFI8kTNFL+m96fMduJF0AfJMt9i
	a18JY37cq8BfuM4Ov3QdkW6kinBDN67kYeXAhuY3zpBbZchHIaWcb0RMPAGghLYJ
	8jVPHchJRF1yEVUzVo0S3HwlKaurtajNzknTp0ikrnQ5V6MO2H/xkZHrviofN+uQ
	WZT3QdGlxbdlM3s7br3w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wnarj0v6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Mar 2024 15:46:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 424FkZQo031536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Mar 2024 15:46:35 GMT
Received: from [10.110.86.150] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Mar
 2024 07:46:34 -0800
Message-ID: <7d1800b1-276f-4426-b8d8-f6cef4545913@quicinc.com>
Date: Mon, 4 Mar 2024 07:46:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: adjust a comment to reflect reality
Content-Language: en-US
To: Kevin Lo <kevlo@kevlo.org>, <ath11k@lists.infradead.org>
CC: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>
References: <ZeWEqGVibkMg2APi@ns.kevlo.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <ZeWEqGVibkMg2APi@ns.kevlo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LsQmatgkR3UfJg280viOPmi-FFU6oOnL
X-Proofpoint-GUID: LsQmatgkR3UfJg280viOPmi-FFU6oOnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_11,2024-03-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=815 adultscore=0
 spamscore=0 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403040120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_074640_771228_9EB859F2 
X-CRM114-Status: UNSURE (   9.42  )
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

On 3/4/2024 12:22 AM, Kevin Lo wrote:
> On QCA6390/QCN9074/WCN6855, MHISTATUS may still have SYSERR bit set
> after SOC_GLOBAL_RESET.
> 
> changes for v2:
> - update comment about resetting MHICTRL to clear SYSERR

for future reference the version log should not be part of the commit text
> 
> Signed-off-by: Kevin Lo <kevlo@kevlo.org>
> --- 

the version log goes here, after the --- ("after the cut")

but no need to send another version -- Kalle can fix this when he pulls
into the pending branch.

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


