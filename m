Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED7DC4321E
	for <ath11k@archiver.kernel.org>; Mon,  5 Dec 2022 09:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8mPjiTqEnpuvjgAMbBFa1Mim/l2Zez218n5Y0GhFqM=; b=kl6hFxMT7WN2ZC
	Dd3gK2mARyXQRdxwMVyQ4DS1q8EUHhfhm+KrgeRQyoaGrZ20UoRfrUFYgSFWS4vrYzWur058wj2FM
	DxJL4kE2deh5Kfzzlbyk1DbOBfTJJp1ioK2ehmsFgDXhd6YMlXgCOfqLOkVdFlW/cZtvgd1I1IOXC
	VY6x1iTYo/QEyywdT3gEflxKU1IrP8aiJBQj5JFBOYNJ6wwLigdR2u1kEThuNNCbl+TzeJ6eyGTRG
	3B4iaqA+NJiHehrRcj0FzhMK3Yq1GQCiXTKRre/xab1krWOtw/ev0laIvxQ8W5zRUZd/qAByHejZG
	MyvSeMS3+NmEaNL6iOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p283O-00HPVV-Dv; Mon, 05 Dec 2022 09:46:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p283L-00HPMh-61
	for ath11k@lists.infradead.org; Mon, 05 Dec 2022 09:46:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B59NGg0014201;
	Mon, 5 Dec 2022 09:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OhTp2WvMu2UaAzetr2/JMUgEf9/T4n4ZdOdow+OJoj0=;
 b=dj/fb7GfyLD+j9QvZb2g+a1Tr8Fr5nnVymu6d44fvo6nQCw5auTs0m5OqEMS0t9hqtGK
 VlTJX8DKqMDEhl3RHCJgQ6XUElUHIir6Jdb5gqb2CumVxC1gJoQBhCHGkY7CMEzDAOYe
 d7e/Ry0kSfZG0g3GCA3/TojuEDep6x6lvU7NiyZFaXNhnQYpPsunf5tChW2XX8HqkU7o
 e0LPxBIspOt7Rh/hN92aW0zRat6I6pUt1wZK/nLuubsetVtfICGlUxc3EgcP7NHXhhsV
 rxvmhu60xaXrSMNB/ZOb3f1ROp7jv9kPfs7q2OG+vQ2KDO1hb7TAKxDw6VezZApBLNmF Ow== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7v5mbx9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Dec 2022 09:46:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B59kJIT012357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Dec 2022 09:46:19 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 5 Dec 2022
 01:46:17 -0800
Message-ID: <9bce39db-1de4-f129-8d2f-77f51a64a5db@quicinc.com>
Date: Mon, 5 Dec 2022 17:46:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 4/5] mac80211: run late dequeue late tx handlers without
 holding fq->lock
Content-Language: en-US
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>
References: <20190316170634.13125-1-nbd@nbd.name>
 <20190316170634.13125-4-nbd@nbd.name>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20190316170634.13125-4-nbd@nbd.name>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jjPRV8iF-eYLevvM9EY2lvCUG3tCEeKb
X-Proofpoint-GUID: jjPRV8iF-eYLevvM9EY2lvCUG3tCEeKb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212050078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_014623_269578_45477769 
X-CRM114-Status: GOOD (  13.23  )
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

T24gMy8xNy8yMDE5IDE6MDYgQU0sIEZlbGl4IEZpZXRrYXUgd3JvdGU6Cj4gUmVkdWNlcyBsb2Nr
IGNvbnRlbnRpb24gb24gZW5xdWV1ZS9kZXF1ZXVlIG9mIGlUWFEgcGFja2V0cwo+Cj4gU2lnbmVk
LW9mZi1ieTogRmVsaXggRmlldGthdSA8bmJkQG5iZC5uYW1lPgo+IC0tLQo+ICAgbmV0L21hYzgw
MjExL3R4LmMgfCAxMCArKysrKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL25ldC9tYWM4MDIxMS90eC5jIGIv
bmV0L21hYzgwMjExL3R4LmMKPiBpbmRleCA4MTI3ZTQzZTEyYjEuLmY4NTM0NGM5YWY2MiAxMDA2
NDQKPiAtLS0gYS9uZXQvbWFjODAyMTEvdHguYwo+ICsrKyBiL25ldC9tYWM4MDIxMS90eC5jCj4g
QEAgLTM1NDQsNiArMzU0NCw3IEBAIHN0cnVjdCBza19idWZmICppZWVlODAyMTFfdHhfZGVxdWV1
ZShzdHJ1Y3QgaWVlZTgwMjExX2h3ICpodywKPiAgIAlpZWVlODAyMTFfdHhfcmVzdWx0IHI7Cj4g
ICAJc3RydWN0IGllZWU4MDIxMV92aWYgKnZpZiA9IHR4cS0+dmlmOwo+ICAgCj4gK2JlZ2luOgo+
ICAgCXNwaW5fbG9ja19iaCgmZnEtPmxvY2spOwpNYXliZSB1c2UtYWZ0ZXItZnJlZSB3aWxsIGhh
cHBlbmVkPwoKWW91IGNhbiBzZWUgaWVlZTgwMjExX3R4X2RlcXVldWUoKSBpbiB0eC5jIGFzIGJl
bG93LCBhZnRlciAKaWVlZTgwMjExX2ZyZWVfdHhza2IoKSwgaXQgd2lsbCBnb3RvIGJlZ2luLApJ
ZiBnb3RvIG91dCBoYXBwZW5lZCBpbiBiZWxvdyBjaGVjaywgdGhlbiB0aGUgc2tiIHdoaWNoIGlz
IGZyZWVkIHdpbGwgYmUgCnJldHVybmVkLCBhbmQgdXNlLWFmdGVyLWZyZWUgd2lsbCBoYXBwZW4u
CgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rdmFsby9h
dGguZ2l0L3RyZWUvbmV0L21hYzgwMjExL3R4LmM/aWQ9ZGVkNDY5OGI1OGNiMjNjMjJiMGRjYmQ4
MjljZWQxOWNlNGU2Y2UwMiNuMzUzOApiZWdpbjoKIMKgwqAgwqBzcGluX2xvY2tfYmgoJmZxLT5s
b2NrKTsKCiDCoMKgIMKgaWYgKHRlc3RfYml0KElFRUU4MDIxMV9UWFFfU1RPUCwgJnR4cWktPmZs
YWdzKSB8fAogwqDCoCDCoMKgwqDCoCB0ZXN0X2JpdChJRUVFODAyMTFfVFhRX1NUT1BfTkVUSUZf
VFgsICZ0eHFpLT5mbGFncykpCiDCoMKgIMKgwqDCoMKgIGdvdG8gb3V0OwoKIMKgwqAgwqBpZiAo
dmlmLT50eHFzX3N0b3BwZWRbaWVlZTgwMjExX2FjX2Zyb21fdGlkKHR4cS0+dGlkKV0pIHsKIMKg
wqAgwqDCoMKgwqAgc2V0X2JpdChJRUVFODAyMTFfVFhRX1NUT1BfTkVUSUZfVFgsICZ0eHFpLT5m
bGFncyk7CiDCoMKgIMKgwqDCoMKgIGdvdG8gb3V0OwogwqDCoCDCoH0KCiDCoMKgIMKgLyogTWFr
ZSBzdXJlIGZyYWdtZW50cyBzdGF5IHRvZ2V0aGVyLiAqLwogwqDCoCDCoHNrYiA9IF9fc2tiX2Rl
cXVldWUoJnR4cWktPmZyYWdzKTsKIMKgwqAgwqBpZiAoc2tiKQogwqDCoCDCoMKgwqDCoCBnb3Rv
IG91dDsKCiDCoMKgIMKgc2tiID0gZnFfdGluX2RlcXVldWUoZnEsIHRpbiwgZnFfdGluX2RlcXVl
dWVfZnVuYyk7CiDCoMKgIMKgaWYgKCFza2IpCiDCoMKgIMKgwqDCoMKgIGdvdG8gb3V0OwoKIMKg
wqAgwqBzcGluX3VubG9ja19iaCgmZnEtPmxvY2spOwoKTWF5YmUgInNrYiA9IE5VTEw7IiBzaG91
bGQgYmUgYWRkZWQgYWZ0ZXIgImJlZ2luOiIuCgouLi4KCgotLSAKYXRoMTFrIG1haWxpbmcgbGlz
dAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
