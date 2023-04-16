Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DB9C77B70
	for <ath11k@archiver.kernel.org>; Sun, 16 Apr 2023 02:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W7l6Wr30pE7dMqeaL3ko3FgTvI/MV3JdA4E3DXkQWXM=; b=EakYZD0sBwpRBY
	zTT8uhAwXqAdQ7AW/VH7VpdTRO85MZcyDxGrJZEHrA3sSu+EVJL6IRj8NguJmfirIpdfh3el55acj
	R9OBYEbgQiEPtSlpNlMSnARJnlAoMKE2Y0tM7462yuVm5CHNYjSdOnnGv3TTV+AtoRnQJCECya+as
	Dxw4ib2OkuwybMAQ85sn02h7p1r5GJL1OThR+qvWs8DX+5LwYrxIioDAbmXZAFiLIzW6dyrwdEp+F
	GvRiqO76TRFHz2N6fCLm8xBRJtrglyXbFJ9XqmGrKio82HlkM5or7LGNEcSMkcNX+Iki82yU7iO8/
	1bXL0qgIsdQTKLrxSXLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnrqW-00CyrR-38;
	Sun, 16 Apr 2023 02:10:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnrqU-00Cyr7-0c
	for ath11k@lists.infradead.org;
	Sun, 16 Apr 2023 02:10:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33G1uoXW008252;
	Sun, 16 Apr 2023 02:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yqa7h6fZ8PxqDN5oB2svtJXsEhJU62CLg9TqIAjRQjE=;
 b=BPSRy6bXmpfpouppLWKgTrIdLY4u+xAp9TQUd76KrjBQKzfgdI0ECKbu3sI0XExT6NTf
 h9u2K2sgpqtvyJKHXKemQDkJMjJ/mZ0eUW8Qxsv/tixQVUBV+gE4TSiZr3/Jk3NGNcKT
 W5LyHd470YUWcATaCTqvhJzlktNZwz7BGM+wrbnkYzaDV5Zz4VMx38K7r02F/HVmE+Ug
 o/yn/LbaFjQAmOcgaOP6/nSb5CjwMJWRSl19i/z++OM8L2Ui1fZxWDSYHxm8uLu2ji6W
 mBXYh3OGhJZG+FrwZEWFtuwyP2AfCALW8d8woT6ksMC7TGs0bbE64RSGc9B0nhopzYHL Nw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pyn7es4g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Apr 2023 02:10:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33G2ANPI023378
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Apr 2023 02:10:23 GMT
Received: from [10.253.76.16] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Sat, 15 Apr
 2023 19:10:22 -0700
Message-ID: <571d8ecf-2ca6-8b7b-6e15-be12c56e9f88@quicinc.com>
Date: Sun, 16 Apr 2023 10:10:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: T42KEk0dmOESgN3bZ-sh9YWJPq8PKMLO
X-Proofpoint-GUID: T42KEk0dmOESgN3bZ-sh9YWJPq8PKMLO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-15_12,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 mlxscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304160018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_191026_263198_FFF2D917 
X-CRM114-Status: GOOD (  10.76  )
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
LTA5LTI4IGF0IDIzOjMzICswODAwLCBXZW4gR29uZyB3cm90ZToKCi4uLgoKSGkgSm9oYW5uZXMs
CgpUaGUgY2hhbmdlIGJlbG93IHdoaWNoIGFkZGVkIGluIGllZWU4MDIxMV9yeF9tZ210X2Fzc29j
X3Jlc3AoKSBieQpwYXRjaCAid2lmaTogbWFjODAyMTE6IHN1cHBvcnQgTUxPIGF1dGhlbnRpY2F0
aW9uL2Fzc29jaWF0aW9uIHdpdGggb25lIApsaW5rIChjb21taXQgODExNTFjZTQ2MmU1KSIKbWF5
YmUgbmVlZCByZWZpbmUgdG8gbWVldCAyIGxpbmtzLgoKSSBoaXQgaXNzdWUgdGhhdCB0aGUgQlNT
IG9mIHRoZSAyIGxpbmsgd2lsbCBhbHdheXMgaG9sZCBhbmQgbmV2ZXIgZnJlZS4KCk15IGNhc2Ug
aXM6CldoZW4gY29ubmVjdCB3aXRoIDIgbGlua3MgQVAsIHRoZSBjZmc4MDIxMV9ob2xkX2Jzcygp
IGlzIGNhbGxlZCBieSAKY2ZnODAyMTFfbWxtZV9hc3NvYygpCmZvciBlYWNoIEJTUyBvZiB0aGUg
MiBsaW5rcywKCldoZW4gYXNzc29jUmVzcCBmcm9tIEFQIGlzIG5vdCBzdWNjZXNzKHN1Y2ggYXMg
c3RhdHVzX2NvZGU9PTEpLCB0aGUgCmllZWU4MDIxMV9saW5rX2RhdGEgb2YgMm5kIGxpbmsoc2Rh
dGEtPmxpbmtbbGlua19pZF0pCmlzIE5VTEwgYmVjYXVzZSBpZWVlODAyMTFfYXNzb2Nfc3VjY2Vz
cygpLT5pZWVlODAyMTFfdmlmX3VwZGF0ZV9saW5rcygpIAppcyBub3QgY2FsbGVkLgoKVGhlbiBz
dHJ1Y3QgY2ZnODAyMTFfcnhfYXNzb2NfcmVzcCByZXNwIGluIGNmZzgwMjExX3J4X2Fzc29jX3Jl
c3AoKSBhbmQKc3RydWN0IGNmZzgwMjExX2Nvbm5lY3RfcmVzcF9wYXJhbXMgY3IgaW4gX19jZmc4
MDIxMV9jb25uZWN0X3Jlc3VsdCgpIAp3aWxsIG9ubHkgaGF2ZSB0aGUgZGF0YSBvZgp0aGUgMXN0
IGxpbmssIGFuZCBmaW5hbGx5IGNmZzgwMjExX2Nvbm5lY3RfcmVzdWx0X3JlbGVhc2VfYnNzZXMo
KSBvbmx5IApjYWxsIGNmZzgwMjExX3VuaG9sZF9ic3MoKQpmb3IgdGhlIDFzdCBsaW5rLCB0aGVu
IEJTUyBvZiB0aGUgMm5kIGxpbmsgd2lsbCBuZXZlciBmcmVlIGJlY2F1c2UgaXRzIApob2xkIGlz
IGF3bGF5cyA+IDAgbm93LgoKSSBmb3VuZCBpdCBpcyBub3QgZWFzeSB0byByZWZpbmUgaXQsIHNv
IGRvIHlvdSBoYXZlIGFueSBhZHZpc2UvaWRlYT8KCmZvciAobGlua19pZCA9IDA7IGxpbmtfaWQg
PCBJRUVFODAyMTFfTUxEX01BWF9OVU1fTElOS1M7IGxpbmtfaWQrKykgewogwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGllZWU4MDIxMV9saW5rX2RhdGEgKmxpbms7CgogwqDCoMKgwqDCoMKgwqAgbGlu
ayA9IHNkYXRhX2RlcmVmZXJlbmNlKHNkYXRhLT5saW5rW2xpbmtfaWRdLCBzZGF0YSk7CiDCoMKg
wqDCoMKgwqDCoCBpZiAoIWxpbmspCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwoK
IMKgwqDCoMKgwqDCoMKgIGlmICghYXNzb2NfZGF0YS0+bGlua1tsaW5rX2lkXS5ic3MpCiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwoKIMKgwqDCoMKgwqDCoMKgIHJlc3AubGlua3Nb
bGlua19pZF0uYnNzID0gYXNzb2NfZGF0YS0+bGlua1tsaW5rX2lkXS5ic3M7CiDCoMKgwqDCoMKg
wqDCoCByZXNwLmxpbmtzW2xpbmtfaWRdLmFkZHIgPSBsaW5rLT5jb25mLT5hZGRyOwogwqDCoMKg
wqDCoMKgwqAgcmVzcC5saW5rc1tsaW5rX2lkXS5zdGF0dXMgPSBhc3NvY19kYXRhLT5saW5rW2xp
bmtfaWRdLnN0YXR1czsKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDExawo=
