Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihw7n-0003pm-9T
 for ath11k@lists.infradead.org; Thu, 19 Dec 2019 13:45:57 +0000
Subject: Re: [RESEND 6/9] ath11k: add debugfs for TWT debug calls
References: <20191204053713.3064-1-john@phrozen.org>
 <20191204053713.3064-7-john@phrozen.org>
 <0101016ecf7e75e3-b26c2edc-e278-4fbc-97d5-fc7f678c240f-000000@us-west-2.amazonses.com>
 <87eex078gs.fsf@kamboji.qca.qualcomm.com>
From: John Crispin <john@phrozen.org>
Message-ID: <5c00b087-f865-f663-cda0-91c196386366@phrozen.org>
Date: Thu, 19 Dec 2019 14:45:52 +0100
MIME-Version: 1.0
In-Reply-To: <87eex078gs.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>, vthiagar@codeaurora.org
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 19/12/2019 14:25, Kalle Valo wrote:
> vthiagar@codeaurora.org writes:
> 
>> On 2019-12-04 11:07, John Crispin wrote:
>>> These new debugfs files allow us to manually add/del/pause/resume TWT
>>> dialogs for test/debug purposes.
>>>
>>
>> Information such as how these debugfs entries are supposed to be used
>> could be helpful.
> 
> Yes, please always add instructions how the debugfs file is supposed to
> be used. Not only it helps the users but makes the review easier as
> well.
> 

I did in the V3 series --> https://patchwork.kernel.org/patch/11290751/
	John

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
