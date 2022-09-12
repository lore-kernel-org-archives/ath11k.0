Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C321ECAAA1
	for <ath11k@archiver.kernel.org>; Mon, 12 Sep 2022 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:CC:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NMbPSvCvfEA9fkj83w8lcWXyEFkCJfFawxmXAa9JYik=; b=TqKKceLCIadcdLpBpg8jdp7S02
	jZPzS9ekCwA43oh37rQHrRla7An7PicCD3HeTw48wiDXjbKHzEa5+icTgENw0bVTqrVvrRsVdTgA1
	lf+SYCvOvufu+em62NAI9BfmBhPNjeyKA/BoISW+roaARGK2GPW4o8PCzmNHvqslC5k5XNNixEP9D
	PlnJ0qMd81kBBefS3uuPdgEcn9TPmpnCwF6mE1DpjjCXFDVrzyCcW+W1IWW9qbJ+cJGa1pisXEG5k
	z0+UzD9etm8vPK0U4D5VDorycEq95kQyW3gbtUUhfHqJSnF8YiqXjK0gZsySETsziU7TJNtblvRnZ
	1glmJ+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXg4e-008PbT-E5; Mon, 12 Sep 2022 09:49:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXg4a-008PXX-E4
	for ath11k@lists.infradead.org; Mon, 12 Sep 2022 09:49:50 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C8VQ9k026206;
	Mon, 12 Sep 2022 09:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=dXs9pfn6TO23ohh9IUm5JgvhvDIhx6vI4dT7SVtSjZ8=;
 b=CPzPdQz4e8dtYdBJK0VxBLPj4HkL9TqrjNz1Wyk3Bhawl0eccw1EdWLSu9Uv8awp99el
 Tr6bmZULIggu5sfJ85RcUAxERtZBaqzYpjdPeQLs+jVN2uF6fgykSMl17EgzhRxE5mDQ
 y5JeDYSjyU0VUhtDyek7Z5Ghh1fcjBMOe644h7mPpQH7VB2KDZfmbzCWM7aDM7MmHhwQ
 5xoBQfhQqOQ9AfIhiFrWqeTBeDcsudcB2n0zSp8LklOCcJWIuJhEEWru3ekOmhLayMhH
 ENBAL3OqjKP8NilcnemmyjPahA6qHNgD6u24USYn02sMOrxboxdtPzX+xWVA6mw8F69i lw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jgk0dbw2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 09:49:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28C9apot002477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 09:36:51 GMT
Received: from [10.253.8.149] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 12 Sep
 2022 02:36:49 -0700
Message-ID: <24df3a0c-a312-d9b6-5840-1eacd79d824b@quicinc.com>
Date: Mon, 12 Sep 2022 17:36:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
From: Wen Gong <quic_wgong@quicinc.com>
Subject: [PATCH] wifi: mac80211: RCU-ify link STA pointers
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0rxJOHafjPyn2veD0bn0yeUKqCTpab97
X-Proofpoint-ORIG-GUID: 0rxJOHafjPyn2veD0bn0yeUKqCTpab97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_06,2022-09-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_024948_503601_95CBFA74 
X-CRM114-Status: UNSURE (   9.95  )
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
IHdoaWNoIG1lYW5zIHRoZSBwcmltYXJ5IGxpbmsuClRoaXMgbGVhZCBkcml2ZXIgZ2V0IG5zcyA9
IDAgZm9yIG90aGVyIGxpbmtzLiBXaWxsIHlvdSBmaXggaXQKb3IgaXMgaXQgZGVzaWduIGJ5IGRl
ZmF1bHQ/CgpPbmx5IHByaW1hcnkgbGluayBoYXMgdmFsaWQgcnhfbnNzIHZhbHVlIHdoaWNoIGlz
IG5vdCAwIGJ5IGJlbG93IGNhbGwgc3RhY2suCmllZWU4MDIxMV9hc3NvY19zdWNjZXNzKCktPgog
wqDCoMKgIHJhdGVfY29udHJvbF9yYXRlX2luaXQoc3RhKTsKCmNvbW1pdDpjNzE0MjBkYjY1M2Fi
YTMwYTIzNGQxZTRjZjg2ZGRlMzc2ZTYwNGZhCndpZmk6IG1hYzgwMjExOiBSQ1UtaWZ5IGxpbmsg
U1RBIHBvaW50ZXJzCgpkaWZmIC0tZ2l0IGEvbmV0L21hYzgwMjExL3JhdGUuYyBiL25ldC9tYWM4
MDIxMS9yYXRlLmMKaW5kZXggYzU4ZDk2ODlmNTFmLi43OTQ3ZTlhMTYyYTkgMTAwNjQ0Ci0tLSBh
L25ldC9tYWM4MDIxMS9yYXRlLmMKKysrIGIvbmV0L21hYzgwMjExL3JhdGUuYwpAQCAtMzcsNyAr
MzcsNyBAQCB2b2lkIHJhdGVfY29udHJvbF9yYXRlX2luaXQoc3RydWN0IHN0YV9pbmZvICpzdGEp
CiDCoMKgwqDCoCBzdHJ1Y3QgaWVlZTgwMjExX3N1cHBvcnRlZF9iYW5kICpzYmFuZDsKIMKgwqDC
oMKgIHN0cnVjdCBpZWVlODAyMTFfY2hhbmN0eF9jb25mICpjaGFuY3R4X2NvbmY7CgotwqDCoMKg
IGllZWU4MDIxMV9zdGFfc2V0X3J4X25zcyhzdGEsIDApOworwqDCoMKgIGllZWU4MDIxMV9zdGFf
c2V0X3J4X25zcygmc3RhLT5kZWZsaW5rKTsKCiDCoMKgwqDCoCBpZiAoIXJlZikKIMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuOwoKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2F0aDExawo=
