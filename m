Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3D9C32771
	for <ath11k@archiver.kernel.org>; Thu, 29 Sep 2022 01:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CuJDZeX+0n+AiAL6+WWg71adUxfg+R9X9mGfZ8AKXM=; b=OWfcpcZQhbF//F
	Lq3FoI7qS9BJZK1m44NSglgYtICMXRV1mWFTaO7/BULsGCh+JwELiCOoIM/gL/Lqr6I1kIQnwiChe
	OreG6n+n6Ad/HWsl12sOzEUz6OOnRMEHOGl5P9wXfOyOyJ+TJZ0OJjPSzwuPZazfn8+bbd474nENA
	qlmCYg/A2ZB+5eeF+w2gWvuZmvqf8el/dRs1C4BkwcDb2J9prH1qbg1EiX87+Xl1SxODkXBaGzg+S
	nt505LeP8mL5HbA+yTKwnxMGbN1qGDydK2nQuyXVgFqh/jLjDXQtMj4Axx+cb0qbEbMfQPinzfoUa
	wJozUKc7wP4eFNTPo7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odior-000v8A-Ri; Thu, 29 Sep 2022 01:58:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odiop-000v7d-6K
	for ath11k@lists.infradead.org; Thu, 29 Sep 2022 01:58:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SNY7sh018224;
	Thu, 29 Sep 2022 01:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=kzVp61ULiNEr/UheqPybYwtTY6JF+p9P2hQujSFnfqk=;
 b=p7sOn75wQfntSVTYZ/geTMGyNUfoa7wiW+qrFDVBgWTTQEmbSgrs9wU+HpzFGhRx+ZZd
 4VeyzuLddot2uiPilJ9nIYZSlwuhH7Egc8G6pt8NrTrcOcFXGt9llvI4rUlbKR26cbtM
 KWTWMc3DWliuia07fJjkvrjvfqMNa4BDn2l74x5RGESo+pNTrsFwZUDaqTC+6tZHlloS
 9ZfAnz+F2DSu2RoSaTo1VD0NBV12PwqqxnpvvQt5ATTTkQ53635JzlFUeewM1gWQKPct
 a5IEy0qlPmhh5BhYwzoC/xhdgrQUMdx32EGrPhFjRzrajz+MFfVpJPn1maFsNZoA9rzj 8w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jvm4vhsj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 01:58:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28T1wQV2032667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 01:58:26 GMT
Received: from [10.253.33.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 28 Sep
 2022 18:58:25 -0700
Message-ID: <d054b305-b711-7b80-a0f7-f32dd1682d27@quicinc.com>
Date: Thu, 29 Sep 2022 09:58:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: parsing the multi-link element with STA profile wifi: mac80211:
 support MLO authentication/association with one link
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <48715509-62fd-2307-e38f-176234b482c1@quicinc.com>
 <f240b33d507daf898480b0a11eb27d4475e45164.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <f240b33d507daf898480b0a11eb27d4475e45164.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6JyFy0_siqUFp-oZu3ALQU7Tj7BoEMx1
X-Proofpoint-GUID: 6JyFy0_siqUFp-oZu3ALQU7Tj7BoEMx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_11,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 mlxlogscore=913 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209290011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_185831_365975_A45C561B 
X-CRM114-Status: GOOD (  13.29  )
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

T24gOS8yOS8yMDIyIDM6MjggQU0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gV2VkLCAyMDIy
LTA5LTI4IGF0IDIzOjMzICswODAwLCBXZW4gR29uZyB3cm90ZToKPj4gSGkgSm9oYW5uZXMsCj4+
Cj4+IE1heSBJIGtub3cgdGhlIHN0YXR1cyBmb3IgYmVsb3cgd29yayB3aGljaCBpcyB3cml0dGVu
IGluIHRoZSBwYXRjaCBiZWxvdz8KPj4gSSB0aGluayBpdCBpcyBuZWVkZWQgaW4KPj4gaWVlZTgw
MjExX2Fzc29jX2NvbmZpZ19saW5rKCkvaWVlZTgwMjExX2Fzc29jX3N1Y2Nlc3MoKSwgcmlnaHQ/
Cj4+Cj4gSXQgcGFzc2VkIHRoZSBwbHVnZmVzdCBsYXN0IHdlZWsgOy0pCml0IGlzIGdvb2QgZm9y
IHRoYXQgOinCoCAtKQo+IFllcywgSSBuZWVkIHRvIGdldCB0aGlzIHBvc3RlZCAuLi4gYnV0IG5v
dyBJIGdvdCBhbm90aGVyIHVyZ2VudCB0aGluZyB0bwo+IGxvb2sgYXQsIHNvIGl0J2xsIGJlIHNv
bWUgdGltZS4KPgo+IGpvaGFubmVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDExawo=
