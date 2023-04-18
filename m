Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3E9C77B75
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 09:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cDP+JaZ4HrUUrLal64fQ+BvIn7/RQS8hwUH9qPNUKYs=; b=SiBroP5hZ+/MAZ
	v1mgX4TPgXczsWCr3zZre0G6DN80eiExTxbIp0V5Gh2equ/EE73IniND4tdgI8zqlFqgH8StQQwwf
	eF/h3wc8HODcBCyj1YZmlJNi1CXMPce04gz4omJ5NfmKCy/AUiiESCvynzFS8xz3nz1kPwbZJyaXS
	cLLyZd81yOaJdhbxhgCys5juIqW95m0ZQkOJPLKcd5KZNRgQI0SSRR/H3NZbtFmsfqx/3bvdOgNou
	l0n6TRBDsRhqV/lwoIUygw7l9tiSsov451ocESA9MEO26Y+CZ8NGHe7vF7rM/wuGGrVTXID+ZS08q
	lX262c2iqfsXwvJDcn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohcp-001T5s-0b;
	Tue, 18 Apr 2023 09:27:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohcm-001T4f-1h
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 09:27:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33I6sfQJ007777;
	Tue, 18 Apr 2023 09:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8faAlypLPe1e1HG5LWGx9Kos22aWupKEa2+SCiIc3BY=;
 b=HlKE1Qtvg1OTwrxyQXX5elS6crzWoL7G/IcMbBtRkuqjVFq1BkKjiySiK1Dk9TgSoUA8
 53HrPKUv08b2FawtfzRIq/okz79AkHlHwLEQauxTYl7t4Mrahn/mmuw7bopx2iJo3Qm1
 N+FgB3EnSopctOJIJOTvsmqYMfIr8BcFDj+LMGIyvXzJx9Foqgp3pSegCiHwJ0BrrEyG
 tR2hcs6zLUwQ0o5oQDZ+a9DVYtx1DQUuLpK4duTa5uUo/cw46GLSfbte0bYA1R+pomXv
 kdf2J0LVJPB3haamap2S7eHmRJoR5F41yv81t5xW8Y/nDd6oM6Rbk3PsE0Tjth4jqt30 XA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q171gjcfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 09:27:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33I9RgU2021421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 09:27:42 GMT
Received: from [10.253.75.31] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 18 Apr
 2023 02:27:41 -0700
Message-ID: <76863dec-1b2f-b933-7c5e-21c732de4bc6@quicinc.com>
Date: Tue, 18 Apr 2023 17:27:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
 <d10b88b4-0bd7-a38c-e8d7-8982a281c4b3@quicinc.com>
 <e5adbed1524b27228c152ba14f78c550c8730baa.camel@sipsolutions.net>
 <c15e368e-2fea-a1d8-9c0d-db9278ded5e5@quicinc.com>
 <113761966918b2f390d3c9304307b42a0b4a829b.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <113761966918b2f390d3c9304307b42a0b4a829b.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DcFUHiZoGWDi28eYYFOkGGXldT-H-5rX
X-Proofpoint-ORIG-GUID: DcFUHiZoGWDi28eYYFOkGGXldT-H-5rX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_05,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=744 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304180081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_022744_681736_CDED47C4 
X-CRM114-Status: GOOD (  22.32  )
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

T24gNC8xOC8yMDIzIDQ6MTggUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gTW9uLCAyMDIz
LTA0LTE3IGF0IDIyOjEzICswODAwLCBXZW4gR29uZyB3cm90ZToKPj4gT24gNC8xMS8yMDIzIDM6
MzggUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4+PiBPbiBUdWUsIDIwMjMtMDQtMDQgYXQgMTE6
MjggKzA4MDAsIFdlbiBHb25nIHdyb3RlOgo+Pj4+IE1heSBJIGFsc28gYWRkIGEgZmllbGQgc3Vj
aCBhcyAidTE2IGFjdGl2ZV9saW5rc19jb3VudCIgaW4gc3RydWN0Cj4+Pj4gd2lwaHlfaWZ0eXBl
X2V4dF9jYXBhYiwKPj4+PiBhbmQgYWRkIGxvZ2ljIGluIGZ1bmN0aW9uIGllZWU4MDIxMV9zZXRf
dmlmX2xpbmtzX2JpdG1hcHMoKSBmb3Igc3RhdGlvbgo+Pj4+IGxpa2UgdGhpcyA/Ogo+Pj4+IGlm
IChhY3RpdmVfbGlua3NfY291bnQgJiYgaHdlaWdodDE2KGxpbmtzKSA8PSBhY3RpdmVfbGlua3Nf
Y291bnQpCj4+Pj4gICAgwqDCoMKgIHRoZW4gc2RhdGEtPnZpZi5hY3RpdmVfbGlua3MgPSBsaW5r
czsKPj4+Pgo+Pj4gQWxzbyBoZXJlLCBub3Qgc3VyZSBpdCBtYWtlcyBzZW5zZSBpbiBjZmc4MDIx
MSBsZXZlbD8KPj4+Cj4+PiBUaG91Z2ggSSdtIG5vdCBzdXJlIHdoYXQgdGhlIGlkZWEgaGVyZSBp
cyBhdCBhbGwgLSB5b3UgY2FuIHJlZnVzZSB0bwo+Pj4gbGluayBzd2l0Y2ggZXRjLCB3aGF0IHdv
dWxkIHlvdSB1c2UgdGhpcyBmb3I/Cj4+IElmIEkgdXNlIGllZWU4MDIxMV9zZXRfYWN0aXZlX2xp
bmtzKCksCj4+IHRoZW4gSSBuZWVkIGFkZCBCU1NfQ0hBTkdFRF9BU1NPQyBhbmQga2V5IGZvciAy
bmQgbGluayBpbiBsb3dlci1kcml2ZXIuCj4+Cj4+IEkgd291bGQgbGlrZSB0byBhY3RpdmUgYWxs
IGxpbmtzIHdoaWxlIGFzc29jLAo+PiB0aGVuIEJTU19DSEFOR0VEX0FTU09DIGFuZCBrZXkgd2ls
bCBhdXRvIHNldCBmb3IgdGhlIDJuZCBsaW5rIHRvCj4+IGxvd2VyLWRyaXZlciBmcm9tIG1hYzgw
MjExLgo+IEknbSBub3QgY29udmluY2VkIHRoYXQgbWFrZXMgc2Vuc2UuIFlvdSdyZSBnb2luZyB0
byBoYXZlIHRvIGJlIGFibGUgdG8KPiBkZWFsIHdpdGggY2hhbmdpbmcgbGlua3MgYWZ0ZXIgYXNz
b2NpYXRpb24gX2FueXdheV8sIHVubGVzcyB5b3UgcGxhbiBvbgo+IGJyZWFraW5nIHRoZSBlbnRp
cmUgY29ubmVjdGlvbiBvbmNlIGFueSBvZiB0aGUgbGlua3MgaXMgZ2V0dGluZyBvdXQgb2YKPiBy
YW5nZSBvciBzb21ldGhpbmc/Cj4KPiBTbyBhbnl3YXkgeW91J3JlIGdvaW5nIHRvIGhhdmUgdG8g
YmUgYWJsZSB0byB0aGlzIGZvciBuZXcgbGlua3MgYW55d2F5Pwo+IEkgbWVhbiBkb2luZyBrZXkg
bWFuYWdlbWVudCB3aGVuIGxpbmsgc3dpdGNoaW5nLCBhbmQgImFzc29jaWF0aW9uIiAoaW4KPiBx
dW90ZXMsIGJlY2F1c2UgYXMgYSB0ZXJtIGRvZXNuJ3QgZXZlbiBtYWtlIHNlbnNlIHNpbmNlIHRo
aXMgc3RhdGUgaXMgb24KPiB0aGUgTUxEIGxldmVsLCBub3QgdGhlIGxpbmsgbGV2ZWwpLi4uCj4K
PiBTbyBub3Qgc3VyZSBJIGdldCBpdD8KPgo+IGpvaGFubmVzCgpZZXMsIHlvdSBhcmUgcmlnaHQu
CgpOb3cgbG93ZXIgZHJpdmVyIEkgdXNlZCBkbyBub3Qgc3RvcmUgdGhlIGtleSBhbmQgZG8gbm90
IHRyaWdnZXIKQlNTX0NIQU5HRURfQVNTT0MgZm9yIG5ldyBsaW5rcyBhZnRlciBhc3NvYy4KClNv
IG15IHN1Z2dlc3Rpb24gaXMgYSB3YXkgdG8gYWN0aXZlIGFsbCBsaW5rcyB3aGlsZSBhc3NvYywg
dGhpcyB3YXkgaXMgCnNpbXBsZSBmb3IgbG93ZXIgZHJpdmVyIEkgdXNlZC4KCkFsc28gaWVlZTgw
MjExX3NldF9hY3RpdmVfbGlua3MoKSBpcyBhbm90aGVyIHdheSB0byBhY3RpdmUgYWxsIGxpbmtz
IAphZnRlciBhc3NvYy4KCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDExawo=
