Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF86CC6FA82
	for <ath11k@archiver.kernel.org>; Tue, 13 Sep 2022 04:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:CC:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PbhE+cW7rh3ZPhMXD7EYK0FyfoaS3M2xJSIjPtq5Vl0=; b=roaoun1uNWThEeCaGH8SGDjbMr
	vkjHmBAvm/rEkmwH3+H2SUsnLceZFgPAATi+xK35xzrDBr4A0vpQNDbhOMi3MVc32aHbMDmX+M0+j
	Ds0ClAcrSD7r40Rbhwj3D0ZUMqMSF7T3IJTjE1JC1duHWuQSvMF+j9eSAVgxOV1Db107CySd9HGp5
	6OKQfjZ+p6mTDdh2UDAM+c5Ihks1mUvt6qOKM4ceZEu5Ud/OBmlrtQxW8DlkEgxs23ae96GwR0lhf
	sqy/HXYE+NM/oUcxBOdPC5QrcmNoHTgu/HPNdFrdlc97O1unxhACCCh+vr99OQinMXDgIe7lUhj5C
	sM6XTNKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXxkS-001oQq-OU; Tue, 13 Sep 2022 04:42:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXxfn-001lT3-JL
	for ath11k@lists.infradead.org; Tue, 13 Sep 2022 04:37:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D2gLCq005362;
	Tue, 13 Sep 2022 04:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=itC7PnvgnfUNIeHDfDsf2M96qNlAteZt2oe8k4pBR9k=;
 b=ia6zkg8xdhSzjTyuGMQ+qu32LfyJq+f3D1R2dXdEM7mqepHSnVd/rnU0LLY3NFq2fAq/
 WxhayrU+Vqt9LXA3fILUC3Dp6zMECOgAJ93S8kmOWbxkCPC5Qvfa7XjQiUIi11aFbNLX
 67CdQzP7iHChxkVfbsl1ytNSbVXBa4MAbSjoBDQ8hkn6wyRkcyx7C0TqQg1z4CLUy8hM
 3R/GI1R6THmPSR4lIcX/WAFzuHyD5Tb2dVK0ITaFYd3QqaBVbxwPUKs/fgA+sRTSfvjB
 cluz/EAEeV+QxiFj97iwdm2RENsKXpLXXqcYpVRBNGXS89U3di0/E1nR2Vf84PKsTpC7 bw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjh9tg7gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 04:37:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28D4bLix032041
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 04:37:21 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 12 Sep
 2022 21:37:19 -0700
Message-ID: <913ee04f-a16f-f765-96c2-0586282831b4@quicinc.com>
Date: Tue, 13 Sep 2022 12:37:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
From: Wen Gong <quic_wgong@quicinc.com>
Subject: mlo rx nss value 0 of wifi
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Vfd04XiTQqNSo2vFPy-k745W6caqvisU
X-Proofpoint-GUID: Vfd04XiTQqNSo2vFPy-k745W6caqvisU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_02,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=799 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209130020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_213723_735391_1FC38997 
X-CRM114-Status: UNSURE (   8.31  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

SGkgSm9oYW5uZXMsCgpDdXJyZW50bHkgZm9yIE1MTyB0ZXN0LCB0aGUgb3RoZXJzIGxpbmtzJ3Mg
cnhfbnNzIG9mIHN0cnVjdAppZWVlODAyMTFfbGlua19zdGEgaXMgc3RpbGwgdmFsdWUgMCBpbiBp
ZWVlODAyMTFfc2V0X2Fzc29jaWF0ZWQoKSwKYmVjYXVlIHRoZXkgYXJlIG5vdCBwYXNzIGludG8g
aWVlZTgwMjExX3N0YV9zZXRfcnhfbnNzKCkgaW4KbWFjODAyMTEgZXhjZXB0IHRoZSBkZWZsaW5r
IHdoaWNoIG1lYW5zIHRoZSBwcmltYXJ5IGxpbmsgaW4KcmF0ZV9jb250cm9sX3JhdGVfaW5pdCgp
LiBUaGlzIGxlYWQgZHJpdmVyIGdldCBuc3MgPSAwIGZvcgpvdGhlciBsaW5rcy4gV2lsbCB5b3Ug
Zml4IGl0IG9yIGlzIGl0IGRlc2lnbiBieSBkZWZhdWx0PwoKT25seSBwcmltYXJ5IGxpbmsgaGFz
IHZhbGlkIHJ4X25zcyB2YWx1ZSB3aGljaCBpcyBub3QgMCBieSBiZWxvdyBjYWxsIHN0YWNrLgpp
ZWVlODAyMTFfYXNzb2Nfc3VjY2VzcygpCiDCoMKgwqAgLT5yYXRlX2NvbnRyb2xfcmF0ZV9pbml0
KHN0YSk7CiDCoMKgIMKgwqDCoMKgIC0+aWVlZTgwMjExX3N0YV9zZXRfcnhfbnNzKCZzdGEtPmRl
ZmxpbmspOwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
