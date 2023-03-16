Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01D1C6FD1F
	for <ath11k@archiver.kernel.org>; Thu, 16 Mar 2023 03:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUawZu8UzWluPRa+x0XjqB3oJrrV7n518pqNFzFY+Wo=; b=dFf2px1x4FCPS6
	HDAt/5om7yjVVNggX+9KZVKguWu+DwHHk8x+lDLrR5/AYwHtBI4M9ViEHY642nri9936hjfnBSLQj
	cDDiVANyRMY4l+i0IkTH+y0Cz/I7CKsdnVpR90X9/3so5OsgwK4vom74D5sShWoPrhgSc77RwTsWc
	8y8pYpAxZLzCpimMUaic/JTwt5o+4k3p3sw/HuIT6JutrQo7wnckPSirFPD6aBm4Xkf+PJMESeu9F
	daq48UkhanUtuEo+N+Pjw5qv9M1Iw2obaswBzFFJRSP3thqHsichHTvKcIBSHxsdIrLwtJQ5Ok9LX
	O2C1LOWutx/8a+OJ9hPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pceRv-00F7ot-1h;
	Thu, 16 Mar 2023 03:38:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pceRr-00F7oD-1d;
	Thu, 16 Mar 2023 03:38:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32G25TH3017225;
	Thu, 16 Mar 2023 03:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vbOIaSWE2S3kwyRzRqrNiZCQIsNc5LyrGc514H2GM/M=;
 b=Ho5QbGTwsPPvxDkkYVhcvkSFNy4PVa+H/8dnvmSbQVPuOBcBovuWvO0M9MxCrV3h1vmz
 pvtMfviSLtMFHqbHXSKGivtSejs9XIQRkpepWVNBdyDW4otEXjfotaN+BzAzEL4VtnZ4
 JtOaMnueZUf8vGCQqZJJeJgAKqIjFGa4ii3hvQ2vrnizVQrzRDRwQEsnEXR+ECNEdIZB
 o9UqpzqPmzwpM4ysB+9DI4j/Aw9Z6mH8lo+DsVC4PdAx75YXM6mWzdLBNHgbvIljahtp
 W6OTfRQdBLx5JGgEJ8qnppjLhDn8e+gHhG754B25N5ixRIQ0xH8kqkudI7RVdBfTDevX Ww== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pbpy9ghw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 03:38:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32G3cZDx016467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 03:38:35 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 15 Mar
 2023 20:38:34 -0700
Message-ID: <3bb7fe91-85bd-8c1e-d7f9-b0272af439c7@quicinc.com>
Date: Thu, 16 Mar 2023 11:38:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/5] SME: Add support for handling authentication with
 MLD
Content-Language: en-US
To: Andrei Otcheretianski <andrei.otcheretianski@intel.com>,
        <hostap@lists.infradead.org>
CC: Ilan Peer <ilan.peer@intel.com>, <ath11k@lists.infradead.org>
References: <20221206094609.104911-1-andrei.otcheretianski@intel.com>
 <20221206094609.104911-2-andrei.otcheretianski@intel.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20221206094609.104911-2-andrei.otcheretianski@intel.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tDD3KBquSLv_oCHEAJILYLBnzTbUinwR
X-Proofpoint-GUID: tDD3KBquSLv_oCHEAJILYLBnzTbUinwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_02,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_203839_667470_D653A5E5 
X-CRM114-Status: GOOD (  13.45  )
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

T24gMTIvNi8yMDIyIDU6NDYgUE0sIEFuZHJlaSBPdGNoZXJldGlhbnNraSB3cm90ZToKLi4uCj4g
ZGlmZiAtLWdpdCBhL3dwYV9zdXBwbGljYW50L2V2ZW50cy5jIGIvd3BhX3N1cHBsaWNhbnQvZXZl
bnRzLmMKPiBpbmRleCBlNTVkYmNlNWEzLi4zYzI3YmJlM2FlIDEwMDY0NAo+IC0tLSBhL3dwYV9z
dXBwbGljYW50L2V2ZW50cy5jCj4gKysrIGIvd3BhX3N1cHBsaWNhbnQvZXZlbnRzLmMKPiAuLi4K
PiArc3RhdGljIGJvb2wgd3Bhc19tbF9lbGVtZW50KHN0cnVjdCB3cGFfc3VwcGxpY2FudCAqd3Bh
X3MsIHN0cnVjdCB3cGFfYnNzICpic3MpCj4gK3sKPiAuLi4KPiArCj4gKwkJCWlmIChuZWlnaF9i
c3MpIHsKPiArCQkJCWlmICh3cGFfc2Nhbl9yZXNfbWF0Y2god3BhX3MsIDAsIG5laWdoX2JzcywK
PiArCQkJCQkJICAgICAgIHdwYV9zLT5jdXJyZW50X3NzaWQsCj4gKwkJCQkJCSAgICAgICAxLCAw
KSkgewpJZiB3cGFfc2Nhbl9yZXNfbWF0Y2goKSBmYWlsLCB0aGVuIHRoZSBuZWlnaF9ic3Mgd2ls
bCBiZSBkcm9wcGVkLCBhbmQgCnRoZSBuZWlnaCBsaW5rIHdpbGwgTk9UIGNvbm5lY3QsIHRoZW4g
TiBsaW5rIHJlZHVjZWQgdG8gTi0xIGxpbmsuCgpmb3IgZXhhbXBsZSwgdGhlIGJzc2lkIGZhaWxl
ZCBjb25uZWN0IGZvciBsYXN0IHRpbWUsIGl0IHdpbGwgYmUgaWdub3JlZCAKZm9yIDEwIHNlY29u
ZHM6CkZlYiAxMyAxNzo0MjoyMCBjc3QtQ2VsYWRvbi1STiB3cGFfc3VwcGxpY2FudFs5NjddOiBB
ZGRlZCBCU1NJRCAKMDA6MDM6N2Y6MDE6NTk6NTAgaW50byBpZ25vcmUgbGlzdCwgaWdub3Jpbmcg
Zm9yIDEwIHNlY29uZHMKRmViIDEzIDE3OjQyOjIwIGNzdC1DZWxhZG9uLVJOIHdwYV9zdXBwbGlj
YW50Wzk2N106IEJTU0lEIAowMDowMzo3ZjowMTo1OTo1MCBpZ25vcmUgbGlzdCBjb3VudCBpbmNy
ZW1lbnRlZCB0byAyLCBpZ25vcmluZyBmb3IgMTAgCnNlY29uZHMKRmViIDEzIDE3OjQyOjIxIGNz
dC1DZWxhZG9uLVJOIHdwYV9zdXBwbGljYW50Wzk2N106IHdsYW4wOsKgwqDCoCBza2lwIC0gCkJT
U0lEIGlnbm9yZWQgKGNvdW50PTIgbGltaXQ9MCkKPiArCQkJCQl3cGFfcy0+dmFsaWRfbGlua3Mg
fD0gQklUKGxpbmtfaWQpOwo+ICsJCQkJCW9zX21lbWNweSh3cGFfcy0+bGlua3NbbGlua19pZF0u
YnNzaWQsCj4gKwkJCQkJCSAgYXBfaW5mby0+ZGF0YSArIDEsIEVUSF9BTEVOKTsKPiArCQkJCQl3
cGFfcy0+bGlua3NbbGlua19pZF0uZnJlcSA9Cj4gKwkJCQkJCW5laWdoX2Jzcy0+ZnJlcTsKPiAr
CQkJCX0gZWxzZSB7Cj4gKwkJCQkJd3BhX3ByaW50ZihNU0dfREVCVUcsCj4gKwkJCQkJCSAgICJN
TEQ6IG5laWdoYm9yIGRvZXNuJ3QgbWF0Y2ggY3VycmVudCBTU0lEIC0gc2tpcCBsaW5rIik7Cj4g
KwkJCQl9Cj4gKwkJCX0gZWxzZSB7Cj4gKwkJCQl3cGFfcHJpbnRmKE1TR19ERUJVRywKPiArCQkJ
CQkgICAiTUxEOiBuZWlnaGJvciBub3QgZm91bmQgaW4gc2NhbiIpOwo+ICsJCQl9Cj4gKwkJfQo+
ICsKLi4uCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
