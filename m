Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNAcm-0006qo-3A
 for ath11k@lists.infradead.org; Tue, 29 Sep 2020 08:04:38 +0000
Message-ID: <d64adff6e323884b0149049ca02f82958a211e2b.camel@sipsolutions.net>
Subject: Re: [PATCHv2 1/2] nl80211: vendor-cmd: qca: add command for ap
 power save
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 29 Sep 2020 10:04:14 +0200
In-Reply-To: <871rilf2th.fsf@codeaurora.org>
References: <1598257589-19091-1-git-send-email-vnaralas@codeaurora.org>
 <4b4a0d79a243c1c3b8044730da0493c96ba294bf.camel@sipsolutions.net>
 <871rilf2th.fsf@codeaurora.org>
MIME-Version: 1.0
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Tue, 2020-09-29 at 10:40 +0300, Kalle Valo wrote:
> Johannes Berg <johannes@sipsolutions.net> writes:
> 
> > On Mon, 2020-08-24 at 13:56 +0530, Venkateswara Naralasetty wrote:
> > > AP power save feature is to save power in AP mode, where AP goes
> > > to power save mode when no stations associate to it and comes out
> > > of power save when any station associate to AP.
> > 
> > Why do you think this requires a vendor command? I mean, that seems like
> > fairly reasonable - even by default - behaviour?
> 
> I have not studied the details, but doesn't AP power save break normal
> functionality? For example, I would guess probe requests from clients
> would be lost. So there's a major drawback when enabling this, right?

Not the way it's described above?

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
