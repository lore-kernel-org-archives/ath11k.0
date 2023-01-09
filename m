Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124F7C5479D
	for <ath11k@archiver.kernel.org>; Mon,  9 Jan 2023 09:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:CC:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YVFrKZs9yAtgc1U/yzq31sAR8hgn0U9qSdWqAMUpEf8=; b=VuGFIGyiyHvJjXkXuGnl9MR6O9
	E3goBBmlugjcG397aXT/pMc10ktZbMAaIp5ogWAnjjLwgtytjX+THivSUw77D+/B490yZ2d8i94Bq
	CNI4poIBsqVtKci64lWLJ/PPtDwXP6P8Nn+t1n4nV2VnddZN+d4Eemw/K7HurRHF/9wJtew3VyvCc
	2tiudqdN0wG1OpZ4pJ8661rLr6xQ72lEOCbNWDHIfs773z4x/KXpdPXCR+ha37shT04ciY5Z+BON7
	kq40EVYGJRdkbd6Kri0RxSwKDBGJt9AtgXeZX+4q5TkTQUCNDPE+/jBSdCuCetesZ4W0L1QtMMNTs
	C78+XPpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEolZ-000fAA-TW; Mon, 09 Jan 2023 09:48:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEolW-000f89-7w
	for ath11k@lists.infradead.org; Mon, 09 Jan 2023 09:48:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3098oGSs002826;
	Mon, 9 Jan 2023 09:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=yqqk2EzZfeChfMWrB1gzEFSlZdqXxGS89cKk9izFgVY=;
 b=Ugue+L0hOlXcLo+DKbUPbEbFRP77du/E495phwwnoyZJW9VipWzuYp8cR8d4wFfoZJ5y
 wQf2tOxDhE7DTibE0gooH9bCr+8JgqeX+0+Ev5EVZvj88kjZxAdFj0WFvLm5sppeqMaT
 hFmnDyPuwuGBGxoooDeyqM+MQUkw14bK5osqmD3UibaD2ZKkciM6rKEDS0TnvxTsc278
 D6zvxUCF252TvKiZIQsB/gTF8uhJhQybSk3nVRbxM91HhuU1nWSt2H4F8CU59giGymB+
 1ggmSpNhaW+8tlpDC3SmY+9tj+qf7btqqSldCsVXJmcFDRD2tJOEpYXNQYEdHxnCA4XP 1w== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3my0yaasnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jan 2023 09:48:20 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3099mKqZ006922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Jan 2023 09:48:20 GMT
Received: from [10.253.34.122] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 9 Jan 2023
 01:48:19 -0800
Message-ID: <efad76dd-14ff-4a36-ec67-fe6f3b8dcc5b@quicinc.com>
Date: Mon, 9 Jan 2023 17:48:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Content-Language: en-US
To: <johannes@sipsolutions.net>, <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
From: Wen Gong <quic_wgong@quicinc.com>
Subject: authentication timed out by "wifi: mac80211: do link->MLD address
 translation on RX"
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PTJ2GypClcugAyHHyzlm3V0Qdho-t7kl
X-Proofpoint-ORIG-GUID: PTJ2GypClcugAyHHyzlm3V0Qdho-t7kl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_03,2023-01-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=861 adultscore=0
 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301090069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_014826_310784_11601EE9 
X-CRM114-Status: UNSURE (   7.31  )
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

SGkgSm9oYW5uZXMsCgpXaGVuIHRoZSByeCBwYWNrZXQgaXMgc2tiX2NvcHkoKSwgdGhlIGhkciBp
cyBub3QgcmUtYXNzaWduIHRoZSBuZXcgc2tiIAp2YWx1ZSwgYW5kIGxlYWQgdGhlCgpvcGVyYXRp
b24gb2YgInRyYW5zbGF0ZSB0byBNTEQgYWRkcmVzc2VzIiB0YWtlIGVmZmVjdCBvbiB0aGUgb3Jp
Z2luYWwgCnNrYiwgYW5kIGxlYWQKCnRoZSBjaGVjayAiaWYgKCFldGhlcl9hZGRyX2VxdWFsKGlm
bWdkLT5hdXRoX2RhdGEtPmFwX2FkZHIsIAptZ210LT5ic3NpZCkpIiBmYWlsIGluIGllZWU4MDIx
MV9yeF9tZ210X2F1dGgoKSwKCmFuZCB0aHVzIGhhcHBlbmVkICJhdXRoZW50aWNhdGlvbiB0aW1l
ZCBvdXQiLgoKQWZ0ZXIgYmVsb3cgY2hhbmdlLCBpc3N1ZSBub3QgaGFwcGVuIGFnYWluLgoKLS0t
IGEvbmV0L21hYzgwMjExL3J4LmMKKysrIGIvbmV0L21hYzgwMjExL3J4LmMKQEAgLTQ4NTQsNiAr
NDg1NCw4IEBAIHN0YXRpYyBib29sIGllZWU4MDIxMV9wcmVwYXJlX2FuZF9yeF9oYW5kbGUoc3Ry
dWN0IAppZWVlODAyMTFfcnhfZGF0YSAqcngsCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOwogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIH0KCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhkciA9ICh2b2lkICopcngt
PnNrYi0+ZGF0YTsKKwogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIHNrYl9jb3B5
KCkgZG9lcyBub3QgY29weSB0aGUgaHcgdGltZXN0YW1wcywgc28gY29weSBpdAogwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBleHBsaWNpdGx5CiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqLwoKCmNvbW1pdDoKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2t2YWxvL2F0aC5naXQvY29tbWl0Lz9pZD00MmZiOTE0OGMwNzgw
MDRkMDdiNGMzOWJkN2IxMDg2YjYxNjU3ODBjCgp3aWZpOiBtYWM4MDIxMTogZG8gbGluay0+TUxE
IGFkZHJlc3MgdHJhbnNsYXRpb24gb24gUlgKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgx
MWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDExawo=
