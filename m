Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE84BC433F5
	for <ath11k@archiver.kernel.org>; Thu, 31 Mar 2022 16:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1z+HyMqQ8FdHIAc5x+x/6hXg1mygW5Uqy1MAlNDK0Y=; b=npAmM+NocfPq8F
	m6HWhfPnuJRZ1X2fwwYi5whNRnHHw+ZY+Dai85Buwzcr67hrkvG2jfr/6rw9bA4MQGcR68GoBBype
	4kn/AXONTJt4/eaFycS94Fr9w7G343T4nl9lC5gjqari+nr+MfLlaaajPe0UpjwhI7xup58375ckO
	viITZg5XBTQdY8M3TS5mmhy6/W5yPSgJYB9Kr3rbr1z4dK/HKPImHgNDsfiweTWGd0MALo4jp5+Tk
	O4cl6Xnb3K43azve6ITlExa3ccGXBc1Y8VZtVkhGaF/YE71U8vxFAQvWsIzydKLVcMazX5h+/HrgU
	UNKNoGsKfoGDmE3gJbOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZxnv-002zJf-9F; Thu, 31 Mar 2022 16:37:47 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZxnr-002zIn-1f
 for ath11k@lists.infradead.org; Thu, 31 Mar 2022 16:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1648744662; x=1649349462;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jmvc6Xsfeo62LT8Wk/xaxePAq2RECAnV2SGLRcc/+94=;
 b=tZv83Y5LaCmy3dsYPMZ79vElsRiA07h+Fqzta/E1n6tfUN1BAagBchUg
 +//XLojCd0zSpV3e8Dmjp39wSqDfxA20/bdegKIvloJAr0VKId4nEVnmR
 AbXmYXHiTXwJj8LgM6nUQAkgCfzmwnkLROlF2hE6+xngao779w5ch4q8v Q=;
Received: from mail-mw2nam08lp2177.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.177])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 16:37:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIQuImMOzzHfyBwOhxlRDvKIPDuDg4cUiyS49V3nc8Umw7AKy8KS2/sZsCrU3mj7cGis1oDlHyGFelCYnatno77u1eTKu2uut2kqMz1+RjfJB4I+ATFrljnmqyF5MuQfYyccpfE8bNuTxQKX3K7dWaKs0vrUPKKn7dqqC35UblySwCD6ePsNRXKLBGhi5TLC4VreYus98XmOORDKEAjeq4IiT4Pq7BaDMYtBmu7J4KIxomsP0/9N9w7QWhjx0asJpu56TajSEXaZKu65daJGV2sxT99oItAMoB9LuHXaia4GhFsRgKLFPx8s1GIl3YFYwa1gWI5KKxPMwGD3/zuq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jmvc6Xsfeo62LT8Wk/xaxePAq2RECAnV2SGLRcc/+94=;
 b=ggo+DpXzwinloi4cCr0lr0+CdcPIzcwxtWm6Rxbs9u07OFz8HbNkIhwFmW1BfWT9qyNf0q/okmJDwE3V+2ovpNqUAGw0nAUJtYP5j7YjRFwlJzwFnernjmBQ8fJA2fT4ondzPSHr83TafH4S+pX5mEfX+cJWZO5YBZHvEDdg0q1/IhQN/WeTNwppSrSrl++ZGe77WsFMjKX74C3iXshJC8bR7KJb27My3yQSzmesjNyEgkLybkhHGEbc5Ac5VlwUK1ZUqjixeDeTGWFDkuB9OYDd4DOfC4tFjqNZ2FxMVIJM/kJE7F+N2PLza1VkdN1uhqWrWlopVxc2XPxyoFEHZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW2PR02MB3899.namprd02.prod.outlook.com (2603:10b6:907:3::30)
 by PH0PR02MB8485.namprd02.prod.outlook.com (2603:10b6:510:10e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 16:37:35 +0000
Received: from MW2PR02MB3899.namprd02.prod.outlook.com
 ([fe80::d163:1cf6:9fda:4b82]) by MW2PR02MB3899.namprd02.prod.outlook.com
 ([fe80::d163:1cf6:9fda:4b82%4]) with mapi id 15.20.5123.019; Thu, 31 Mar 2022
 16:37:35 +0000
From: "Nagarajan Maran (QUIC)" <quic_nmaran@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@kernel.org>, 
 "Nagarajan Maran (QUIC)" <quic_nmaran@quicinc.com>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH v5.18] ath11k: fix driver initialization failure with WoW
 unsupported hw
Thread-Topic: [PATCH v5.18] ath11k: fix driver initialization failure with WoW
 unsupported hw
Thread-Index: AQHYRNFW+lpV0OMIdUmEcCGwKggX46zZTwVggACKIAD//9fRsA==
Date: Thu, 31 Mar 2022 16:37:35 +0000
Message-ID: <MW2PR02MB3899E0AF9C08EDF0F9CE1E52EDE19@MW2PR02MB3899.namprd02.prod.outlook.com>
References: <20220331073110.3846-1-quic_nmaran@quicinc.com>
 <87sfqyv1td.fsf@kernel.org>
 <2f25bb87e665488b30f6fdaa5877ad8b5b19da0a.camel@sipsolutions.net>
In-Reply-To: <2f25bb87e665488b30f6fdaa5877ad8b5b19da0a.camel@sipsolutions.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 408ae2c1-9681-4e83-2e19-08da1334c311
x-ms-traffictypediagnostic: PH0PR02MB8485:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <PH0PR02MB84858387D279D14E8115E60A91E19@PH0PR02MB8485.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gxs+34XOJT8S2YeSlM6GqQ5F9uQIyNsN2lgLXYFjIeE91P2SDyUQkLpTUuT60iGBecA/s1UyHX8bZkcWsFPr0puJqZPhounm6YY/7mAPJtpdHYqQioV36BgML0mFBhZiJ2G6nNWK/BMgv8XHtVGKWOiXNuQAVQsSyGuR/WTstglMTo/0Vxuf3XygmXNQbwTNeCvVVrw8m5Tf31UbWbKsWFFAxMDZBTBqSaffKyVkvLcmDktRWfmBJK2YgSyoyHY+LlSdKLsagMSUeOzaUNArhXmeK90Q5uz94Dji3voW6rusNdXDX86dOzhHRhjphBWu/HxlqhL7neJKzU/GgfGHiQHFkXyZJDN5zx4X7Ulb4zhP+LKzKyQljQ99cBUZ7BYciZGPDrJOA5rXrTrkn0NcRLHHeyRtn79I4CUxDbVT2Jzam+FjDuX0YXnt+ITIxZkJWxtFBw6bv/Ap4lZf/pY4GT+hylEi2fI2eTZX3pRurU03uVlfg/O39q3x+nWDr+2oi0xlIE7i3MxO5goX+T2FGoINhX48xsE+6rHZ/om+blxQPSm+aYW43w9+sPtlrxnJpvUh7lAe/pEpWwSGxir1lQ3CnRGAfYpswROtQ345iw2ujj3NixPjFgVq1f1kVYbfXhzYO7z3RN2R6RWSvNinMAysNvgJ+j1wLLmpwvqInIIYxIJN9aRBG+xshmrrANVUmcknHqZQAwS4COd8rqICBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR02MB3899.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66446008)(64756008)(76116006)(66556008)(186003)(26005)(66946007)(8676002)(4326008)(54906003)(33656002)(316002)(55016003)(110136005)(83380400001)(52536014)(122000001)(71200400001)(8936002)(4744005)(5660300002)(38100700002)(55236004)(6506007)(7696005)(9686003)(2906002)(38070700005)(53546011)(86362001)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGJ5Um0zVnBVelJxcm9wdnNMMVJySk1DSDBoWUVyUHNqMDRRd0ExdmpYWEdI?=
 =?utf-8?B?RURCK0xRWjBFRDEwaWQzWEd3U3ZVZ1k4bUVRUXBBUmZHVG54K2UxZU12QjZ4?=
 =?utf-8?B?MTEzZ0pIWmtCV3NHTFpiT1RNT1EzSGpPV2V6ZlpXSVpCQVNhWmt4Yzloc2JB?=
 =?utf-8?B?UXhpZ2tjazRvL0tUaS91cWJodEpuNjU0VTY2NnpIZnlyNVNXWDNpNUNaL2cv?=
 =?utf-8?B?S2JIc0tzRFZFMDgvcHVCVGF6U2IvVjF0bTdEOHh6S0x5MWFKT3ljZ2VnVmo5?=
 =?utf-8?B?K0R4Sm5xdlptZFFDSVpNTDF3MFIrTVJpb0tranNuVVg5WFJ0UkFkWUkyQ2Z5?=
 =?utf-8?B?L1ZjdWVHa0ZsbUsyQTJFblJrR0hNZlJ4L3U3U0FUekxOajdTMlo3SXFxSkhS?=
 =?utf-8?B?V0g1ZWFzakIySlZLRzF6Q2tURC96UmRZKzJZMmxBblpQY0JWdElSRnpGVkdT?=
 =?utf-8?B?T3FrSituejZPZjRjc0lzY3JCS2FGSDVoTVB4WTdmMXJvVE9LQ1J0b0FneEY0?=
 =?utf-8?B?cHovVGUxVXNxYWNmVVhGdUxmc3pPQmVUWkxWNXJGRkNkODhxQnlXZUlMS3hu?=
 =?utf-8?B?Vm1HZlBhUmRpa1pucDdTZzFicWhKV3g3d2xjRkVRMklic3cvNy9QS01sYW83?=
 =?utf-8?B?QzhUTVpEVkRQRFV5M0RrdHFyeGpjejJiU1lpaGJHZGM0cVBkc0trN2NnUFcr?=
 =?utf-8?B?eGx0M0RBc1NHR0RzaWIzZzJ3VW0wam5WYUE4dENQdDlwaTV5SlV3ai9SQi9V?=
 =?utf-8?B?OTNrcTRmclg5SjRwb0hGREp3SmJPY0I5S1hpcHdEM01pNXgxOUlTcGxWYm93?=
 =?utf-8?B?NE8xMElGcU1vWktnRUJmYUFSRjYySkx4b1BnWUxrTmVYNjJVVndPSTl5NElD?=
 =?utf-8?B?TFhDWFB6UmtmdzdNZldjR2ZieDZuWWRFTytPRWwyVmcwVWI0bEVKeGxxT3NV?=
 =?utf-8?B?TXBLOXR3NDBJRFZKL0IydDZhaURIK3ppZWhUTG83UUg1NEdDUzBYcjFHcEpk?=
 =?utf-8?B?Z3VncmtzcG90NlFLMEhBbWZLbzNVMHg0bnltRmN5blR6WlJvaDAwVWQ0OXU0?=
 =?utf-8?B?UXB1NkFNcFhIa3pYbmJVZ0p1V0lIbUZTWlV2dGdhS2ZDRWdRYlcya2NNNVpn?=
 =?utf-8?B?dEJIN3JzZXM5eHhwNGZFMTgzdy91NkhXeFJoQkk4bUdFd1M3ZUVOSDJadWRU?=
 =?utf-8?B?ckl3d3ltMENFaERiMis2RERNYUxmazZyWlZldFNPak9XR2pMYS9jK0xBeFNI?=
 =?utf-8?B?bW03czE1U2NudkhVaGFBcnhjK1Y2YkJSSEtHSkxRTVJsbXFRSHZuSkhEWjU2?=
 =?utf-8?B?RDVkZy92alViUXdWb0prOGkxNExac3NmZ25RWDlrdC9PUVJLSHVKNkhUMnds?=
 =?utf-8?B?VjZkL2ZwN0xaUmtSQ0JBMG5mREhSUHJBeGk0dTQ2SUNtL0Y4bnNCNWZOY1Jj?=
 =?utf-8?B?UFc3S09UaDlkN2lBeW83Wm1TMzVrQUpxUHQ1WjNWMERObEptaVI4SmxxaG01?=
 =?utf-8?B?Z04rNXFnalYxRUwwckdkT1ZMa3RYV3B5VWtPVUdvZE5naDk0ZmMwdXc0L21q?=
 =?utf-8?B?ME5TV0J3bitTdXFoY1AxSEN2dURzNXZTMmM4UERyckFMYVFUQWlLb3BsTG1L?=
 =?utf-8?B?R2Rwd00wU2FFbVRvTmI5ai9mUUUyZEtlSTFlcnVwcFRTRGlRc3NzclZUdk1R?=
 =?utf-8?B?K1lBZnRSYzZhazNCb3ZoanE3TlNzditHUmZUZTlybmp4SHB0S1hhWll5RVRJ?=
 =?utf-8?B?MVBmbGhwZ2t3eGRKc3FWMFVvdWlManAxVm5sNklWZWM5cWVvWm5MaGhnQWxk?=
 =?utf-8?B?cGZkQ092QzJOeXR6QTF0Z2hUS1F4YzQzMEpEY3JocEdrYUNDbXdYS2czVDJi?=
 =?utf-8?B?VjRwelB6R2k1VnZsOXQwSFU0K3VnVGNEaWdaWkZWSWZ0aitYa21nMEJqdVhp?=
 =?utf-8?B?QmJLSlRBeUdJenJpYkpoS21MZUcrclByOENuUzRhd3E4OXlyUjNpVmltSmFP?=
 =?utf-8?B?MkNwaitjb3Z4UEh5anRoOHFhSC91ZCtxN3BBWnlWRTdjcHFXY2dtbDZYajhK?=
 =?utf-8?B?SklodDBDUlhaRzd5d3FOZXhWemtwL2dXMGQxbUFSZ1o5Tm9VQnV3dVpOa0FB?=
 =?utf-8?B?WkV0b0RPMU1WREpLK1kxRi9UOE83MWl5aUlIRGowSXhYZVZIRnJNdmZUb3lM?=
 =?utf-8?B?TnVpRTlSczEyR3doK1pKbDh6dnMxOEQ5NFZhT3QwZnZIUnM0UnBhcEUwVm9S?=
 =?utf-8?B?WWgwWXREKy9FN1pnczJVbXl0a245NzJKdW9mdkV6N2N1MFpRUElvQjB3U2F5?=
 =?utf-8?B?Y1lETWphVHpQeWwzWGQ0WkIrTTZuc09oUVdwNmkvZTNDc0JlTkxCUT09?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3899.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 408ae2c1-9681-4e83-2e19-08da1334c311
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 16:37:35.7162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jvbfytnTQPjHEsmkPfA25bDwUZCiW1hwY6oc3ilfhnOudKCm0kqtlxXeWLtzaP0abc0/orRkizm3nP6HsscySw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8485
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_093743_139993_B373C9F1 
X-CRM114-Status: UNSURE (   7.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

-----Original Message-----
From: Johannes Berg <johannes@sipsolutions.net> 
Sent: Thursday, March 31, 2022 5:29 PM
To: Kalle Valo <kvalo@kernel.org>; Nagarajan Maran (QUIC) <quic_nmaran@quicinc.com>
Cc: ath11k@lists.infradead.org; linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5.18] ath11k: fix driver initialization failure with WoW unsupported hw

On Thu, 2022-03-31 at 13:44 +0300, Kalle Valo wrote:
> > 
> > Fixes: ba9177fcef21 ("Add basic WoW functionalities")
> 
> Fixes tag is wrong, it should be:
> 
> Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")
> 

$ git config --global --add alias.fixes 'show -q --format=fixes'
$ git config --global --add pretty.fixes 'Fixes: %h ("%s")'
$ git config --global --add core.abbrev 12 $ git fixes ba9177fcef21
Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")

:)

Johannes

Thank you for the commands.

-Nagarajan



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
